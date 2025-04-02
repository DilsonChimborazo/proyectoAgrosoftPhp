---
title: "Eliminar Venta"
description: " Permite eliminar una venta específica registrada en el sistema."

---

## **Descripción**
Solicitud diseñada para eliminar una venta específica registrada en el sistema de manera eficiente.

---

## **Método**
```http
DELETE
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
Si la eliminación es exitosa, recibirás un código **200 OK** con el siguiente mensaje:

```json
{
    "message": "Venta eliminada con éxito"
}
```

### **Códigos de Respuesta**
- **200**: Venta eliminada exitosamente.
- **400**: Error en la solicitud debido a datos inválidos o inexistentes.
- **500**: Error interno en el servidor.

---

📝 **Nota:** Solo los administradores o usuarios con los permisos adecuados están autorizados para realizar la eliminación de registros de venta en el sistema.

---
