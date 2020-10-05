SELECT
	pag.num_doc,
	pol.ide_poliza,
	pol.num_poliza ,
	pol.ide_producto
FROM
	dbo.sus_poliza pol
INNER JOIN dbo.sus_resp_pago_poliza pag ON
	pol.ide_poliza = pag.ide_poliza
WHERE
	pag.num_doc IS NOT NULL
	AND pag.lov_tipo_doc = 'NUMPRE'
GROUP BY
	pol.ide_poliza ,
	pag.num_doc,
	pol.num_poliza,
	pol.ide_producto
HAVING
	pol.ide_poliza IN(
	SELECT
		--TOP 10 
 vigentes.ide_poliza
	FROM
		(
		SELECT
			DISTINCT b.fecha_ini_vig, b.fecha_fin_vig, a.num_poliza, a.ide_poliza, c.num_renovacion, a.ide_producto, a.sts_poliza
		FROM
			sus_poliza a, sus_solicitud_endoso b, sus_transaccion c
		WHERE
			a.ide_poliza = b.ide_poliza
			and a.ide_producto in (11)
			AND b.ide_solicitud = c.ide_solicitud
			AND a.ide_poliza = c.ide_poliza
			AND c.sts_transaccion = 'CER'
			AND b.sts_solic = 'ACT'
			AND b.lov_tipo_endoso in ('NUE', 'REN')
			AND b.fecha_ini_vig <= '20190905'
			AND b.fecha_fin_vig > '20190905'
			AND c.fecha_endoso <= '20190905'
			AND 'ANU' <> (
			SELECT
				x.lov_tipo_endoso
			FROM
				sus_solicitud_endoso x
			WHERE
				x.ide_poliza = a.ide_poliza
				AND x.ide_solicitud = (
				SELECT
					MAX(ide_solicitud)
				FROM
					sus_solicitud_endoso y
				WHERE
					y.ide_poliza = a.ide_poliza
					AND y.sts_solic = 'ACT'
					AND fec_solic < '20190905'))) vigentes )
ORDER BY
	pag.num_doc