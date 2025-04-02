---
title: "Obtener Ventas"
description: Recupera todas las ventas registradas dentro del sistema.

---

## **Descripción**
Esta solicitud permite obtener el listado completo de las ventas registradas en el sistema.

---

## **Método**
```http
GET
```

---

## **Solicitud**

### **Endpoint**
```http
http://127.0.0.1:8000/apiPhp/venta/
```

### **Cuerpo de la Solicitud**
No se requiere enviar un cuerpo en la solicitud.

---

## **Respuesta**

### **Éxito**
Si la solicitud es exitosa, recibirás un código **200 OK** con la siguiente estructura:

```json
[
    {
        "id_venta": 1,
        "precio_unitario": 25.50,
        "cantidad": 10,
        "fecha_venta": "2025-03-26",
        "fk_id_produccion": 3
    },
    {
        "id_venta": 2,
        "precio_unitario": 30.00,
        "cantidad": 5,
        "fecha_venta": "2025-03-27",
        "fk_id_produccion": 4
    }
]
```

| Campo             | Tipo       | Descripción                          |
|--------------------|------------|--------------------------------------|
| id_venta           | integer    | Identificador único de la venta      |
| precio_unitario    | decimal    | Precio por unidad del producto       |
| cantidad           | integer    | Cantidad de unidades vendidas        |
| fecha_venta        | date       | Fecha en que se realizó la venta     |
| fk_id_produccion   | integer    | ID de la producción asociada         |

---

### **Códigos de Respuesta**
- **200**: Consulta exitosa, devuelve el listado de ventas.
- **500**: Error interno en el servidor.

---

📝 **Nota:** Solo los administradores o usuarios con los permisos adecuados están autorizados para consultar los registros de ventas en el sistema.

---
