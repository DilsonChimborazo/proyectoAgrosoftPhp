---
title: "Actualizar Parcialmente Herramienta"
description:  "Permite actualizar parcialmente los datos de una herramienta en el sistema."
---


## Descripción:
Solicitud utilizada para modificar uno mas atributos de una herramienta sin necesiad de enviar toda la informacion.

---


## Metodo: 
```
 PATCH
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/herramienta/{id_herramienta}
```

### **Cuerpo de la solicitud**
Envía un objeto JSON con el campo que deseas actualizar:

```json
{
    "nombre_h": "Taladro inalámbrico",
    "estado": "En mantenimiento"
}
```

| Campo           | Tipo   | Requerido | Descripción                |
|----------------|--------|-----------|-----------------------------|
| id_herramienta             | number | ✅       | Identificador único de la herramienta   |
| nombre_h       | text   | ✅       | Nombre de la herramienta      |
| fecha_prestamo | date   | ✅       | Fecha de prestao de la herramienta     |
| estado         | string | ✅       | Estado actual de la herramienta     |


## **Respuesta**

Si las credenciales son correctas, recibirás un código **201** con la siguiente estructura:

```json
{
    "id_herramienta": 1,
    "nombre_h": "Taladro inalámbrico",
    "fecha_prestamo": "2025-05-12",
    "estado": "En mantenimiento"
}
```

:::markdown
| Campo           | Tipo   | Descripción                |
|----------------|--------|-----------------------------|
| id_herramienta             | number | Identificador único de la herramienta  |
| nombre_h       | text   | Nombre de la herramienta      |
| fecha_prestamo | date   | Fecha de prestamo de la herramienta     |
| estado         | string | Estado actual de la herramienta      |
:::


### **Códigos de respuesta**
- **201**: Actualizacion exitosa, devuelve el array de la herramienta registrada.
- **400**: Credenciales incorrectas.
- **500**: Error del servidor.

---

📄 **Nota:**  Solo los administradores pueden actualizar los datos de las herramientas en el sistema.