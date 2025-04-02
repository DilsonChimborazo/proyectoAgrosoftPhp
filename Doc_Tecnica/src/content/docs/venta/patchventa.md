---
title: "Actualizar Venta"
description: " Modifica los datos de una venta previamente registrada en el sistema."

---

## **Descripción**
Esta solicitud permite actualizar uno o varios campos de una venta registrada en el sistema.

---

## **Método**
```http
PATCH
```

---

## **Solicitud**

### **Endpoint**
```http
http://127.0.0.1:8000/apiPhp/venta/{id_venta}
```

### **Cuerpo de la Solicitud**
El cuerpo de la solicitud debe enviarse en formato JSON y puede incluir uno o más de los siguientes campos:

```json
{
    "precio_unitario": 15.50
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
Si la solicitud es correcta, recibirás un código **200 OK** junto con la información actualizada de la venta:

```json
{
    "id_venta": 1,
    "precio_unitario": 15.50,
    "cantidad": 10,
    "fecha_venta": "2025-03-26",
    "fk_id_produccion": 2
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
- **200**: Actualización realizada con éxito. Devuelve los datos actualizados.
- **400**: Error en la solicitud debido a datos inválidos o malformados.
- **404**: No se encontró una venta con el ID proporcionado.
- **500**: Error interno en el servidor.

---

📝 **Nota:** Solo los administradores o vendedores con permisos adecuados están autorizados para modificar registros de ventas.

---

