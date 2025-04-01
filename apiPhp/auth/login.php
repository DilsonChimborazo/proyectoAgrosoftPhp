<?php
require_once(__DIR__ . '/../config/dataBase.php');
require_once(__DIR__ . '/../models/Usuario.php');
require_once(__DIR__ . '/../vendor/autoload.php');

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

// Bloquear solicitudes que no sean POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(["message" => "Método no permitido"]);
    http_response_code(405);
    exit();
}

// Conexión a la base de datos
$database = new DataBase();
$db = $database->getConection();
$usuario = new Usuario($db);

// Recibimos los datos del JSON
$data = json_decode(file_get_contents("php://input"), true);

// Validamos que los datos necesarios estén presentes
if (!isset($data['identificacion']) || !isset($data['contrasena'])) {
    echo json_encode(["message" => "Datos incompletos"]);
    http_response_code(400);
    exit();
}

// Buscamos el usuario por identificación
$user = $usuario->getById($data['identificacion']);

if (!$user) {
    error_log("Usuario no encontrado en la BD");
    echo json_encode(["message" => "Usuario no encontrado"]);
    http_response_code(404);
    exit();
}

// Depuración: Mostrar la contraseña ingresada y la de la BD
error_log("Contraseña ingresada: " . $data['contrasena']);
error_log("Contraseña almacenada: " . $user['contrasena']);

// Verificamos si la contraseña coincide con la encriptada
if (!password_verify($data['contrasena'], $user['contrasena'])) {
    error_log("Contraseña incorrecta");
    echo json_encode(["message" => "Credenciales incorrectas"]);
    http_response_code(401);
    exit();
}

// Generamos el JWT
$secret_key = "lucy";
$payload = [
    "iss" => "localhost",
    "aud" => "localhost",
    "iat" => time(),
    "exp" => time() + (60 * 60 * 12), // Expira en 12 hora
    "data" => [
        "id" => $user['identificacion'],
        "nombre" => $user['nombre']
    ]
];

// Generamos el token
$jwt = JWT::encode($payload, $secret_key, 'HS256');

// Enviamos la respuesta con el token generado
echo json_encode(["token" => $jwt]);
http_response_code(200);
