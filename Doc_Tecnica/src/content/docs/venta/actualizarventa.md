---
title: "Actualizar Venta"
description: "Actualiza los datos de una venta ya registrada en el sistema."
---

## **Descripción**
Esta solicitud permite actualizar los datos de una venta previamente registrada en el sistema.

---

## **Método**
```
PUT
```

---

## **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/venta/{id_venta}
```

### **Cuerpo de la Solicitud**
El cuerpo de la solicitud debe enviarse en formato JSON y contener los siguientes campos:

```json
{
    "precio_unitario": 25.50,
    "cantidad": 10,
    "fecha_venta": "2025-03-26",
    "fk_id_produccion": 3
}
```

| Campo             | Tipo       | Requerido | Descripción                          |
|--------------------|------------|-----------|--------------------------------------|
| precio_unitario    | decimal    | ✅        | Precio por unidad del producto       |
| cantidad           | integer    | ✅        | Cantidad de unidades vendidas        |
| fecha_venta        | date       | ✅        | Fecha en que se realizó la venta     |
| fk_id_produccion   | integer    | ✅        | ID de la producción asociada         |

---

## **Respuesta**

### **Éxito**
Si la actualización es exitosa, recibirás un código **200 OK** junto con los datos actualizados en la siguiente estructura:

```json
{
    "id_venta": 1,
    "precio_unitario": 25.50,
    "cantidad": 10,
    "fecha_venta": "2025-03-26",
    "fk_id_produccion": 3
}
```

### **Códigos de Respuesta**
- **200**: Actualización realizada exitosamente. Devuelve los datos actualizados.
- **400**: Error en la solicitud debido a datos inválidos o incompletos.
- **500**: Error interno en el servidor.

---

📄 **Nota:** Solo los administradores o usuarios con permisos adecuados pueden realizar actualizaciones en los registros de ventas.

---
