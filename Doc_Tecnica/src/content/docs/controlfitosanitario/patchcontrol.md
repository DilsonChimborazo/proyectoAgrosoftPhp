---
title: "Actualizar Control Fitosanitario"
description: "Actualiza los datos de un control fitosanitario ya registrado en el sistema."
---

## Descripción:

Solicitud utilizada para la actualización de los datos de un control fitosanitario previamente registrado.

---

## Metodo:
```
 PATCH
```
---


# **Solicitud**

### **Endpoint**
```
http://127.0.0.1:8000/apiPhp/control_fitosanitario/{id_control_fitosanitario}
```
### **Cuerpo de la solicitud**
Envía un objeto JSON con los siguientes campos:

```json
{
    "descripcion": "Aplicación de control ecológico",
}
```

| Campo           | Tipo   | Requerido | Descripción                |
|---------------- |--------|-----------|-----------------------------|
| descripcion     | string | ✅       | Descripcion del control|


## **Respuesta**

Si las credenciales son correctas, recibirás un código **201** con la siguiente estructura:

```json
{
    "id_control_fitosanitario": 1,
    "fecha_control": "2024-03-26",
    "descripcion": "Aplicación de control ecológico",
    "fk_id_desarrollan": "plaga en el cultivo de maiz"
}
```

:::markdown
| Campo           | Tipo   | Descripción                |
|-----------------|--------|-----------------------------|
| fecha_plantacion| string | 2024-03-26     |
| descripcion     | string | Aplicación de control ecológico|
| fk_id_especie   | string | plaga en el cultivo de maiz|
:::


### **Códigos de respuesta**
- **201**: Actualización exitosa, devuelve el objeto del control actualizado.
- **400**: Datos inválidos o error de validación.
- **500**: Error del servidor.

---

📄 **Nota:** Solo los administradores o encargados pueden actualizar la información de un control. Los usuarios sin permisos adecuados no podrán realizar esta acción.
