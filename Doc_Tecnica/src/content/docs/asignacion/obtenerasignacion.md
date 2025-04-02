---
title: "Obtener Asignaciones de Actividad"
description: "Obtiene todos los registros de asignación de actividad registrados en el sistema."
---

## Descripción:
Solicitud utilizada para obtener todos los registros de asignación de actividad registrados en el sistema.

---

## Método: 
```
 GET
```
---

# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/asignacion_actividad/
```

## **Respuesta**

Si la solicitud es exitosa, recibirás un código **201** con la siguiente estructura:

```json
[
    {
        "id_asignacion_actividad": 1,
        "fecha": "2025-04-05",
        "fk_id_actividad": 2,
        "fk_identificacion": 123456789
    }
 
]
```

:::markdown
| Campo                  | Tipo    | Descripción                                  |
|------------------------|---------|----------------------------------------------|
| id_asignacion_actividad | integer | Identificación de la asignación de actividad |
| fecha                 | string  | Fecha de la asignación (YYYY-MM-DD)         |
| fk_id_actividad       | integer | Identificación de la actividad asignada     |
| fk_identificacion     | integer  | Identificación del usuario asignado         |
:::

### **Códigos de respuesta**
- **201**: Consulta exitosa, devuelve los datos de las asignaciones de actividad.
- **400**: Solicitud incorrecta.
- **500**: Error del servidor.

---

📄 **Nota:** Solo los administradores o instructores pueden obtener información sobre las asignaciones de actividad en el sistema.