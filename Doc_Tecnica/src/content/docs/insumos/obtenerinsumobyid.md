---
title: "Obtener insumo por id"
description: "Recupera la información de un insumo específico mediante su identificador único."
---


## Descripción:
Solicitud utilizada para obtener los datos de un insumo registrado en el sistema a través de su ID.

---


## Metodo: 
```
 GET
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/insumos/{id_insumo}
```

### **Cuerpo de la solicitud**

## **Respuesta**

Si las credenciales son correctas, recibirás un código **201** con la siguiente estructura:

```json
{
    "id_insumo": 1,
    "nombre": "Cemento",
    "tipo": "Material de construcción",
    "precio_unidad": 12.75,
    "cantidad": 50,
    "unidad_medida": "bolsa"
}
```

:::markdown
| Campo           | Tipo   | Descripción                |
|----------------|--------|-----------------------------|
| id_insumo      | number | Identificador unico del insumo   |
| nombre         | string | Nombre del insumo      |
| tipo           | string | Tipo de insumo (Ej: Material de construcció)       |
| precio_unidad  | number | Precio por unidad    |
| cantidad       | number | Cantidad disponible     |
| unidad_medida  | string | Unidad de medida del insumo     |
:::


### **Códigos de respuesta**
- **201**: Autenticación exitosa, devuelve el array al insumo obtenido por id.
- **400**: Credenciales incorrectas.
- **500**: Error del servidor.

---

📄 **Nota:** Solo los administradores pueden acceder a la informacion de los insumos. Los aprendices no tienen permisos para realizar esta acción.