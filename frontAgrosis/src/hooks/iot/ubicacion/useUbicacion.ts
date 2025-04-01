import { useQuery } from '@tanstack/react-query';
import axios from 'axios';

const apiUrl = import.meta.env.VITE_API_URL;

// Interfaz para Ubicacion
export interface Ubicacion {
  id_ubicacion: number;
  latitud: number;
  longitud: number;
}

// Función para obtener las ubicaciones desde la API con autenticación
const fetchUbicaciones = async (): Promise<Ubicacion[]> => {
  const token = localStorage.getItem("token");

  if (!token) {
    throw new Error("No autorizado. Inicie sesión.");
  }

  try {
    const { data } = await axios.get(`${apiUrl}ubicacion/`, {
      headers: {
        Authorization: `Bearer ${token}`,
        Accept: "application/json",
      },
    });
    return data;
  } catch (error) {
    console.error("Error al obtener las ubicaciones:", error);
    throw new Error("No se pudo obtener la lista de ubicaciones");
  }
};

// Hook para usar las ubicaciones
export const useUbicaciones = () => {
  return useQuery<Ubicacion[], Error>({
    queryKey: ['ubicaciones'],
    queryFn: fetchUbicaciones,
    staleTime: 1000 * 60 * 10, // 10 minutos de tiempo de stale
  });
};
