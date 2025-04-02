---
title: "Actualizar producción"
description: "Actualiza los datos de un registro de producción ya registrado en el sistema."
---

## Descripción:
Solicitud utilizada para la actualización de los datos de un registro de producción previamente registrado.

---

## Método: 
```
 PATCH
```
---

# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/produccion/{id_produccion}
```

### **Cuerpo de la solicitud**
Envía un objeto JSON con el campo que deseas actualizar:

```json
{
    "cantidad_produccion": 500.75
}
```

| Campo               | Tipo    | Requerido | Descripción                           |
|--------------------|---------|-----------|---------------------------------------|
| cantidad_producida | decimal | ✅       | Cantidad de producción actualizada |

## **Respuesta**

Si la actualización es exitosa, recibirás un código **200** con la siguiente estructura:

```json
{
    "id_produccion": 1,
    "fk_id_cultivo": 3,
    "cantidad_producida": 500.75,
    "fecha_produccion": "2025-03-26"
}
```

---

### **Códigos de respuesta**
- **200**: Actualización exitosa, devuelve el registro actualizado.
- **400**: Datos incorrectos o faltantes.
- **500**: Error del servidor.

---

📄 **Nota:** Solo los administradores o usuarios con permisos pueden actualizar registros de producción en el sistema.

