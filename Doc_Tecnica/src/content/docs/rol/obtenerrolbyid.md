---
title: "Obtener Roles por id"
description: "Obtiene la lista de roles registrados en el sistema por id"
---

## Descripción:
Este endpoint permite obtener un rol por id registrados en la base de datos.

---

## Método:
```
 GET
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/rol/{id_rol}
```
---

## **Respuesta**

Si la solicitud es exitosa, recibirás un código **200** con la siguiente estructura:

```json
[
    {
        "id_rol": 1,
        "fecha_creacion": "2025-03-27",
        "nombre_rol": "aprendiz"
    },
]

```

| Campo           | Tipo   | Requerido | Descripción                |
|----------------|--------|-----------|-----------------------------|
| fecha_creacion | date   | ✅       | fecha creacion del usuario  |
| nombre_rol            | string | ✅       | Nombre del rol              |

### **Códigos de respuesta**
- **201**: rol obtenido con exito, devuelve el array del rol registrado.
- **400**: Credenciales incorrectas.
- **500**: Error del servidor.

---

📄 **Nota:** Los roles se crean directamente en el backend para utilizarlo en frontend al momento de crear un usuario.
