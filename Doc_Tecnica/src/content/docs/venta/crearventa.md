---
title: "Crear Venta"
description: "Registra una nueva venta en el sistema."

---

## **Descripción**
Esta solicitud permite registrar nuevas ventas en el sistema de manera eficiente.

---

## **Método**
```
POST
```

---

## **Solicitud**

### **Endpoint**
```http
http://127.0.0.1:8000/apiPhp/venta/
```

### **Cuerpo de la Solicitud**
El cuerpo de la solicitud debe enviarse en formato JSON y contener los siguientes campos:

```json
{
    "precio_unitario": 10.50,
    "cantidad": 5,
    "fecha_venta": "2025-03-26",
    "fk_id_produccion": 1
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
Si la creación es exitosa, recibirás un código **201 Created** junto con los datos de la nueva venta en la siguiente estructura:

```json
{
    "id_venta": 1,
    "precio_unitario": 10.50,
    "cantidad": 5,
    "fecha_venta": "2025-03-26",
    "fk_id_produccion": 1
}
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
- **201**: Venta creada exitosamente. Devuelve la información de la venta registrada.
- **400**: Error en la solicitud debido a datos inválidos o incompletos.
- **500**: Error interno en el servidor.

---

📝 **Nota:** Solo los administradores o usuarios con los permisos adecuados están autorizados para registrar nuevas ventas en el sistema.

---
