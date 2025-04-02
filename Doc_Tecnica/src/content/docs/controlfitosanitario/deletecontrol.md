---
title: "Eliminar Control Fitosanitario"
description: "Eliminar un control fitosanitario registrado en el sistema."
---

## Descripción:

Solicitud utilizada para la eliminacion de controles fitosanitarios no deseados.

---

## Metodo:
```
 DELETE
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/control_fitosanitario/{id_control_fitosanitario}
```
### **Cuerpo de la solicitud**
Envía un objeto JSON con los siguientes campos:
`

| Campo           | Tipo   | Requerido | Descripción                |
|---------------- |--------|-----------|---------------------------|
| id_control_fitosanitario              | integer | ✅      | id del control fitosanitario|


## **Respuesta**

Si las credenciales son correctas, recibirás un código **201** con la siguiente estructura:

```json
{
    "message": "Control Fitosanitario eliminado con exito",
}
```



### **Códigos de respuesta**
- **201**: Control fitosanitario eliminado exitosamente del sistema.
- **400**: Credenciales incorrectas.
- **500**: Error del servidor.

---

📄 **Nota:** Solo los administradores o encargados pueden eliminar un control fitosanitario. Los usuarios sin permisos adecuados no podrán realizar esta acción.
