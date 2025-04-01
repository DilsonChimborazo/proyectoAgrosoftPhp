import { useQuery } from "@tanstack/react-query";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const apiUrl = import.meta.env.VITE_API_URL;

export interface Ubicacion {
  id_ubicacion: number;
  latitud: number;
  longitud: number;
}

export interface Lotes {
  id_lote: number;
  fk_id_ubicacion: Ubicacion;
  dimension: string;
  nombre_lote: string;
  estado: string;
}

const fetchLotes = async (): Promise<Lotes[]> => {
  const token = localStorage.getItem("token");
  
  if (!token) {
    throw new Error("No autorizado. Inicie sesión.");
  }

  try {
    const { data } = await axios.get(`${apiUrl}lote/`, {
      headers: { Authorization: `Bearer ${token}` },
    });

    if (!data || !Array.isArray(data.data)) {
      console.error("La API no devolvió un array:", data);
      throw new Error("Respuesta inesperada de la API");
    }

    return data.data;  
  } catch (error) {
    console.error("Error al obtener los lotes:", error);
    throw new Error("No se pudo obtener la lista de lotes");
  }
};

export const useLotes = () => {
  const navigate = useNavigate();

  return useQuery<Lotes[], Error>({
    queryKey: ["lotes"],
    queryFn: async () => {
      try {
        return await fetchLotes();
      } catch (error) {
        // Si el error es de no autorizado, redirige al inicio de sesión
        if ((error as Error).message === "No autorizado. Inicie sesión.") {
          navigate("/"); 
        }
        throw error;  // Vuelve a lanzar el error para manejarlo a nivel de React Query
      }
    },
    staleTime: 1000 * 60 * 10, // 10 minutos, ajustable según tus necesidades
    retry: false,  // Deshabilita los reintentos automáticos
  });
};
