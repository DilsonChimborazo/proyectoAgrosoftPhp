---
title: "Actualizar producción"
description: "Actualiza los datos de un registro de producción ya existente en el sistema."
---

## Descripción:
Solicitud utilizada para la actualización de los datos de un registro de producción ya existente.

---

## Método: 
```
 PUT
```
---

# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/produccion/{id_produccion}
```

### **Cuerpo de la solicitud**
Envía un objeto JSON con los siguientes campos:

```json
{
    "fk_id_cultivo": 5,
    "cantidad_producida": "200.7500000000",
    "fecha_produccion": "2025-03-27"
}
```

| Campo               | Tipo     | Requerido | Descripción                         |
|---------------------|----------|-----------|-------------------------------------|
| fk_id_cultivo              | integer  | ✅       | Identificador del cultivo asociado  |
| cantidad_producida | decimal  | ✅       | Cantidad producida                  |
| fecha_producida              | date     | ✅       | Fecha del registro de producción    |

## **Respuesta**

Si la actualización es exitosa, recibirás un código **200** con la siguiente estructura:

```json
{
    "id_produccion": 1,
    "fk_id_cultivo": 5,
    "cantidad_producida": "200.7500000000",
    "fecha_produccion": "2025-03-27"
}
```

---

| Campo               | Tipo     | Descripción                         |
|---------------------|----------|-------------------------------------|
| id_produccion      | integer  | Identificador único de la producción |
| fk_id_cultivo              | integer  | Identificador del cultivo asociado  |
| cantidad_producida | decimal  | Cantidad producida                  |
| fecha_produccion              | date     | Fecha del registro de producción    |

---

### **Códigos de respuesta**
- **200**: Actualización exitosa, devuelve los datos del registro actualizado.
- **400**: Datos incorrectos o faltantes.
- **500**: Error del servidor.

---

📄 **Nota:** Solo los administradores o usuarios con permisos pueden actualizar registros de producción en el sistema.

