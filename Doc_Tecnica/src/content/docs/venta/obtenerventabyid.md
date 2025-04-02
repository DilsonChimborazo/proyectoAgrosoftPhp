---

title: "Obtener Venta por ID"
description: " Obtén los datos detallados de una venta registrada en el sistema mediante su identificador único."

---

## **Descripción**
Esta solicitud permite recuperar la información específica de una venta registrada en el sistema a través de su ID.

---

## **Método**
```http
GET
```

---

## **Solicitud**

### **Endpoint**
```http
http://127.0.0.1:8000/apiPhp/venta/{id_venta}
```

### **Cuerpo de la Solicitud**
No se requiere enviar un cuerpo en la solicitud.

---

## **Respuesta**

### **Éxito**
Si la solicitud es exitosa, recibirás un código **200 OK** con la siguiente estructura:

```json
{
    "id_venta": 1,
    "precio_unitario": 25.50,
    "cantidad": 10,
    "fecha_venta": "2025-03-26",
    "fk_id_produccion": 3
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
- **200**: Consulta exitosa, devuelve los datos de la venta.
- **404**: No se encontró una venta con el ID proporcionado.
- **500**: Error interno en el servidor.

---

📝 **Nota:** Solo los administradores o usuarios con permisos adecuados están autorizados para consultar registros de ventas mediante su ID.

---

