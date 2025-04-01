import { useQuery } from '@tanstack/react-query';
import axios from 'axios';

const apiUrl = import.meta.env.VITE_API_URL;

export interface TipoCultivo {
  id_tipo_cultivo: number;
  nombre: string;
  descripcion: string;
}

export interface Especie {
  id_especie: number;
  nombre_comun: string;
  nombre_cientifico: string;
  descripcion: string;
  fk_id_tipo_cultivo: TipoCultivo | null;
}

export interface Semillero {
  id_semillero: number;
  nombre_semilla: string;
  fecha_siembra: string;
  fecha_estimada: string;
  cantidad: number;
}

export interface Cultivo {
  id: number;
  fecha_plantacion: string;
  nombre_cultivo: string;
  descripcion: string;
  fk_id_especie: Especie | null;
  fk_id_semillero: Semillero | null;
}

export interface Produccion {
  id_produccion: number;
  fk_id_cultivo: number;
  cantidad_producida: number;
  fecha_produccion: string;
  fk_id_lote: number;
  descripcion_produccion: string;
  estado: string;
  fecha_cosecha: string;
}

const fetchProduccion = async (): Promise<Produccion[]> => {
  const token = localStorage.getItem("token");
  
  if (!token) {
    throw new Error("No autorizado. Inicie sesión.");
  }

  try {
    const { data } = await axios.get(`${apiUrl}produccion/`,{
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    if (!data || !Array.isArray(data.data)) {
      console.error("La API no devolvió un array:", data);
      throw new Error("Respuesta inesperada de la API");
    }

    return data.data;
  } catch (error) {
    console.error("Error al obtener los datos de producción:", error);
    throw new Error("No se pudo obtener la lista de producción");
  }
};

export const useProduccion = () => {
  return useQuery<Produccion[], Error>({
    queryKey: ['produccion'],
    queryFn: fetchProduccion,
    staleTime: 1000 * 60 * 10,
  });
};
