---
title: "Eliminar Ubicación"
description: "Eliminar ubicaciones en el sistema."
---


## Descripción:
Solicitud utilizada para eliminar ubicaciones.

---


## Metodo: 
```
 DELETE
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/ubicacion/{id_ubicacion}
```

### **Cuerpo de la solicitud**
Envía un objeto JSON con los siguientes campos:


| Campo           | Tipo   | Requerido | Descripción                |
|----------------|--------|-----------|-----------------------------|
| id_ubicacion    | integer | ✅       | Identificador de la ubicacion |


## **Respuesta**

Si las credenciales son correctas, recibirás un código **201** con la siguiente estructura:

```json
{
    "message": "Ubicacion eliminada con exito",
}
```

### **Códigos de respuesta**
- **201**: Eliminacion exitosa.
- **400**: Credenciales incorrectas.
- **500**: Error del servidor.

---

📄 **Nota:**  Solo los administradores o usuarios con permisos especiales pueden Eliminar las ubicaciones en el sistema.

