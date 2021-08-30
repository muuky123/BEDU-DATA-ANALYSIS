def test_variables(globs):
    """ Prueba para Reto 01: lista de variables"""
    
    vars_1 = [
        "var_1",
        "variable_nueva_2",
        "Variable_nueva_3",
        "var_3_1",
        "varNueva4",
        "var_nuevaNumero",
        "var_num",
        "VarNum",
        "soyUnaVariable",
        "soyVariableDelAño"
    ]
    vars_2 = [
        "var_1",
        "variable_nueva_2",
        "Variable_nueva_3",
        "var_3_1",
        "varNueva4",
        "",
        "var_num",
        "",
        "soyUnaVariable",
        ""
    ]
    v = sum([v in globs for v in vars_1])
    if v == 0:
        print("""
        ERROR: Debes ejecutar primero la celda donde están
        definidas las variables!
        """)
        return
        
    sv = sum([(v in globs) != bool(vars_2[i]) for i, v in enumerate(vars_1)])
    if sv > 0:
        print(f"""
        ERROR: Hay {sv} variables erroneamente definidas,
        comenta o descomenta alguna e intenta de nuevo!
        """)
    else:
        print(f"""
        FELICIDADES!: Todas las variables definidas son correctas
        """)
    for v in vars_1:
        if v in globs:
            del globs[v]

def test_asignacion_variables(globs):
    """ Prueba para Reto-01: Asignación de variables """
    vars_1 = [
        "variable_locochona",
        "var_decimal",
        "var_hecha_de_cinco_palabras",
        "variable_con_numeros_3_4"
    ]
    vars_2 = [
        12345,
        14.567,
        5234,
        12342
    ]
    v = sum([v in globs for v in vars_1])
    if v == 0:
        print("""
        ERROR: 0 Variables definidas, debes agregar cuando menos una variable y
        ejecutar primero la celda anterior.
        """)
        return
    
    sv = sum([(v not in globs) or (globs[v] != vars_2[i]) for i, v in enumerate(vars_1)])
    if sv > 0:
        print(f"""
        ERROR: Hay {sv} variables erroneamente definidas,
        revisa el nombre y el valor de cada variable e intenta de nuevo!
        """)
    else:
        print(f"""
        FELICIDADES!: Todas las variables definidas son correctas
        """)
    for v in vars_1:
        if v in globs:
            del globs[v]
