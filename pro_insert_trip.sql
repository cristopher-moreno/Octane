create or replace
procedure public.pro_insert_trip(p_id_trip integer, p_punto_inicio integer, p_punto_fin integer, p_fecha_inicio date, p_fecha_fin date, p_costo numeric, p_volumen numeric) language plpgsql as $$ begin
insert
	into
	public.trip (id_trip, punto_inicio , punto_fin , fecha_inicio , fecha_fin, costo, volumen, distancia, duracion, economia_combustible, costo_trip )
values (p_id_trip, p_punto_inicio, p_punto_fin, p_fecha_inicio, p_fecha_fin, p_costo, p_volumen,(p_punto_fin - p_punto_inicio ),(((p_fecha_fin::DATE)-(p_fecha_inicio::DATE))+ 1), ((p_punto_fin - p_punto_inicio )/ p_volumen), (p_costo /(((p_fecha_fin::DATE)-(p_fecha_inicio::DATE))+ 1)) );
end;

$$ ;
