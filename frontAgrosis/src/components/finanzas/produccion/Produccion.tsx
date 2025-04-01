import { useState } from "react";
import { useProduccion } from "../../../hooks/finanzas/produccion/useProduccion";
import Tabla from "../../globales/Tabla";
import VentanaModal from "../../globales/VentanasModales";
import { useNavigate } from "react-router-dom";


const ProduccionComponent = () => {
  const navigate = useNavigate();
  const { data: producciones, isLoading, error } = useProduccion();
  const [selectedProduccion, setSelectedProduccion] = useState<object | null>(null);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const openModalHandler = (produccion: object) => {
    setSelectedProduccion(produccion);
    setIsModalOpen(true);
  };

  const handleRowClick = (produccion: object) => {
    openModalHandler(produccion);
  };

  const closeModal = () => {
    setSelectedProduccion(null);
    setIsModalOpen(false);
  };

  const handleUpdate = (cultivo: { id_produccion: number }) => {
    navigate(`/actualizarproduccion/${cultivo.id_produccion}`);
  };

  const handleCreate = () => {
    navigate("/Registrar-Producción");
  };

  if (isLoading) return <div className="text-center text-gray-500">Cargando producciones...</div>;
  if (error instanceof Error) return <div className="text-center text-red-500">Error al cargar los datos: {error.message}</div>;

  // Mapeo de los datos para la tabla
  const produccionList = Array.isArray(producciones) ? producciones : [];
  const mappedProducciones = produccionList.map((produccion) => ({
    id_produccion: produccion.id_produccion,
    cultivo: produccion.fk_id_cultivo?? null,
    descripcion: produccion.descripcion_produccion?? null,
    estado: produccion.estado?? null,
    fecha_produccion: produccion.fecha_produccion?? null,
    fecha_cosecha: produccion.fecha_cosecha?? null,
    lotes: produccion.fk_id_lote?? null,
    cantidad_producida: produccion.cantidad_producida ?? null,
  }));

  const headers = ["ID Produccion", "cultivo", "descripcion", "estado","fecha_produccion", "Fecha_cosecha","lotes","cantidad_producida"];


  return (
    <div className="mx-auto p-4">

      <Tabla 
        title="Lista de Producciones" 
        headers={headers} 
        data={mappedProducciones} 
        onClickAction={handleRowClick} 
        onUpdate={handleUpdate}
        onCreate={handleCreate}
        createButtonTitle="Crear"
      />

      {selectedProduccion && (
        <VentanaModal isOpen={isModalOpen} onClose={closeModal} titulo="Detalles de Producción" contenido={selectedProduccion} />
      )}
    </div>
  );
};

export default ProduccionComponent;
