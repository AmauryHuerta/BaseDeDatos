# Diccionario de Datos - Ventas Vehiculos

## Tabla Sucursal

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroSucursal`     | INT          | -      | ✅  | ❌  | ❌   | ✅     |           -                            | -                                | Identificador de sucursal               |
| `NombreSucursal`        | NVARCHAR      | 20   | ❌  | ❌  | ❌   | ✅     | -            | -                                | Nombre de la sucursal          |
| `Ubicacion`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ✅     | -         | -                                | Ubicacion de la Sucursal                        |


## Tabla Cliente


## Tabla Vehiculo
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroVehiculo`     | INT          | -      | ✅  | ❌  | ❌   | ✅     |           -                            | -                                | Identificador del vehiculo               |
| `Placa`        | NCHAR      | 7   | ❌  | ❌  | ❌   | ✅     | -            | -                                | Numero de placa del vehiculo          |
| `marca`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ✅     | -         | -                                | Ubicacion de la Sucursal                        |
| `marca`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ✅     | -         | -                                | Ubicacion de la Sucursal                        |
| `marca`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ✅     | -         | -                                | Ubicacion de la Sucursal                        |
| `NumeroCliente`          | INT         | -     | ❌  | ✅  | ❌   |❌      | Cliente(NumeroCliente)    | -                                | Cliente que rento el vehiculo                        |
| `marca`          | NVARCHAR          | 20      | ❌  | ❌  | ❌   | ✅     | -         | -                                | Ubicacion de la Sucursal                        |