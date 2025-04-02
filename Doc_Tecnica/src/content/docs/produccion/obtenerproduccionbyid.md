---
title: "Obtener producción por ID"
description: "Obtiene un registro de producción dentro del sistema mediante su ID."
---


## Descripción:
Solicitud utilizada para obtener un registro de producción dentro del sistema mediante su ID.
---

## Metodo: 
```
 GET
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/produccion/{id_produccion}
```
### **Cuerpo de la solicitud**

## **Respuesta**

Si la solicitud es correcta, recibirás un código **201**  con la siguiente estructura:
```json
{
    "id_produccion": 1,
    "fk_id_cultivo": 5,
    "cantidad_producida": "150.5000000000",
    "fecha_produccion": "2025-03-26"
}
```
:::markdown
| Campo              | Tipo   | Descripción                |
|--------------------|--------|-----------------------------|
| id_produccion      | integer| Identificador único de la producción |
| fk_id_cultivo              | integer| Identificador del cultivo asociado      |
| cantidad_producida| decimal| Cantidad producida      |
| fecha_produccion              | date   | Fecha del registro de producción      |

:::

### **Códigos de respuesta**

- **201**:  Solicitud exitosa, devuelve el registro de producción.

- **400**: Solicitud incorrecta.

- **500**: Error del servidor.

---


📄 **Nota:**  Solo los administradores o usuarios con permisos pueden registrar o modificar la producción en el sistema.

