# ecotrack_patrones

App Flutter con seis casos de EcoTrack. Cada pantalla resuelve un problema
distinto usando un patrón de diseño.

## Actividad

1. Lee el código en `lib/casos/`.
2. Identifica qué patrón de diseño aplica cada archivo.
3. Renombra cada archivo con el nombre del patrón correspondiente.
4. Actualiza `lib/main.dart`: imports, menú con el nombre de cada patrón
   y las redirecciones correctas a cada pantalla.

```bash
flutter pub get
flutter run
flutter test
```

## Casos

| Archivo en `lib/casos/` | Patrón | Pantalla | Qué lo demuestra |
|---|---|---|---|
| `repository.dart` | Repository | `PantallaConsumo` | La pantalla usa el contrato `AlmacenConsumo` y no sabe que los litros viven en memoria (`ConsumoEnMemoria`). |
| `adapter.dart` | Adapter | `PantallaMedidor` | `LectorMedidor` convierte el texto de `MedidorLegado` en el `double` que espera la app. |
| `factory.dart` | Factory | `PantallaAviso` | `Aviso.paraMeta` decide qué aviso construir según la meta. |
| `strategy.dart` | Strategy | `PantallaTope` | `ValidadorLectura` recibe una `ReglaTope` (`TopeAgua` o `TopeLuz`) y no cambia entre reglas. |
| `observer.dart` | Observer | `PantallaPaneles` | `RegistroConsumo` notifica con `ChangeNotifier` y los paneles se actualizan sin conocerse. |
| `dependency_injection.dart` | Inyección de dependencias | `PantallaLab` | `PantallaRegistro` recibe la `FuenteLab` desde fuera, así se ensaya el fallo sin cambiar la pantalla. |

`lib/main.dart` también inyecta el almacén y el lector desde `main()` hacia
`EcoTrackApp`.
