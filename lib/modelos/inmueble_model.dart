class Inmueble {
    int id;
    String ubicacion;
    int precio;
    String moneda;
    int superficieTotal;
    int superficieCubierta;
    int numeroRecamaras;
    int numeroSanitarios;
    String operacion;
    int mesesRenta;
    int diasCobro;
    String estado;
    String fotos;
    String descripcion;
    String tipo;
    String servicios;

    Inmueble({
        this.id,
        this.ubicacion,
        this.precio,
        this.moneda,
        this.superficieTotal,
        this.superficieCubierta,
        this.numeroRecamaras,
        this.numeroSanitarios,
        this.operacion,
        this.mesesRenta,
        this.diasCobro,
        this.estado,
        this.fotos,
        this.descripcion,
        this.tipo,
        this.servicios,
    }){
      this.mesesRenta = 0;
      this.diasCobro = 0;
    }

    factory Inmueble.fromJson(Map<String, dynamic> json) => Inmueble(
        id: json["id"],
        ubicacion: json["ubicacion"],
        precio: json["precio"],
        moneda: json["moneda"],
        superficieTotal: json["superficieTotal"],
        superficieCubierta: json["superficieCubierta"],
        numeroRecamaras: json["numeroRecamaras"],
        numeroSanitarios: json["numeroSanitarios"],
        operacion: json["operacion"],
        mesesRenta: json["mesesRenta"],
        diasCobro: json["diasCobro"],
        estado: json["estado"],
        fotos: json["fotos"],
        descripcion: json["descripcion"],
        tipo: json["tipo"],
        servicios: json["servicios"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ubicacion": ubicacion,
        "precio": precio,
        "moneda": moneda,
        "superficieTotal": superficieTotal,
        "superficieCubierta": superficieCubierta,
        "numeroRecamaras": numeroRecamaras,
        "numeroSanitarios": numeroSanitarios,
        "operacion": operacion,
        "mesesRenta": mesesRenta,
        "diasCobro": diasCobro,
        "estado": estado,
        "fotos": fotos,
        "descripcion": descripcion,
        "tipo": tipo,
        "servicios": servicios,
    };
}