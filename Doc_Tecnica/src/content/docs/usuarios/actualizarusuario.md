---
title: "Actulaizar usuario"
description:  "Actualiza los datos de los usuarios ya registrados en el sistema."
---


## Descripción:
Solicitud utilizada para la actualización de los datos de un usuario ya registrado previamente.

---


## Metodo: 
```
 PUT
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/usuario/{identificacion}
```

### **Cuerpo de la solicitud**
Envía un objeto JSON con los siguientes campos:

```json
{
    "identificacion": "1234567891",
    "nombre": "Dilson",
    "apellido": "Chimborazo",
    "email": "Dilson@gmail.com",
    "password": "123456.",
    "fk_id_rol": 1
}
```

| Campo           | Tipo   | Requerido | Descripción                |
|----------------|--------|-----------|-----------------------------|
| identificacion | number | ✅       | Identificación del usuario  |
| nombre         | string | ✅       | Nombre del usuario      |
| apellido       | string | ✅       | Apellido del usuario      |
| email          | string | ✅       | Email del usuario      |
| password       | string | ✅       | Contraseña del usuario      |
| fk_id_rol      | integer| ✅       | Rol asignado del usuario      |

## **Respuesta**

Si las credenciales son correctas, recibirás un código **201** con la siguiente estructura:

```json
{
    "identificacion": "1234567891",
    "nombre": "Dilson",
    "apellido": "Chimborazo",
    "email": "Dilson@gmail.com",
    "password": "123456.",
    "fk_id_rol": 1
}
```

:::markdown
| Campo           | Tipo   | Descripción                |
|----------------|--------|-----------------------------|
| identificacion | string | Identificación del usuario  |
| nombre         | string | Nombre del usuario      |
| apellido       | string | Apellido del usuario      |
| email          | string | Email del usuario      |
| password       | string | Contraseña del usuario      |
| fk_id_rol      | integer| Rol asignado del usuario      |
:::


### **Códigos de respuesta**
- **201**: Actualizacion exitosa, devuelve el array del usuario registrado.
- **400**: Credenciales incorrectas.
- **500**: Error del servidor.

---

📄 **Nota:** Solo los administradores o usuarios autorizados pueden actualizar los datos del producto en el sistema.



