# Sistema de Diseño — Panel Interno CNG V4

> Actualizado: octubre 2026. Catálogo vivo en la ruta **`/sistema-de-diseno`** (`src/app/components/sistema-diseno/`).
> Si un patrón cambia en un módulo, actualízalo aquí **y** en esa página.
> Skill para Claude Code: `.claude/skills/sistema-diseno-cng/SKILL.md` (flujo de trabajo + checklist). El botón "Descargar skill" del catálogo la genera con estas reglas incrustadas.

---

## Stack tecnológico

| Capa | Tecnología |
|------|------------|
| Framework principal | **Angular 18.2** (`src/app/components/`) — standalone components, signals |
| Versión secundaria | React + Vite (`src-react/`) — no se toca salvo instrucción explícita |
| Estilos | Tailwind CSS v4 + PostCSS |
| Iconos | `app-icon` (SVG Lucide incrustados en `icon.component.html`) |
| Animaciones | `tw-animate-css` (`animate-in fade-in …`) o `@keyframes` en `styles: []` |
| Mapas | Mapbox GL JS (módulo Viajes) |

Reglas Angular: HTML siempre en `templateUrl` (nunca `template:` inline), dark mode con `themeService.darkMode()`, clases condicionales con ternario en `[class]`, routing con `inject(Router)`.

---

## Colores

### Paleta base

| Nombre | Hex | Uso |
|--------|-----|-----|
| Navy principal | `#052850` | Texto principal, botón primario (light), card (dark) |
| Celeste acento | `#c1d6f5` | Primario en dark mode, foco (dark), selección |
| Azul noche | `#041a34` | Canvas de página (dark), wizard a pantalla completa (dark) |
| Azul superficie | `#224164` | Secondary (dark), barra de selección (dark) |
| Gris superficie | `#eff0f0` | Fondo de tabs/pills, botón secundario, divisores |
| Hover azul | `#eff6ff` | Hover, fila seleccionada, fondo de ícono |
| Blanco hueso | `#fbfbfc` | Toolbar y header de tabla, barra de filtros, canvas |
| Input | `#f3f3f5` | Fondo de inputs en modales |
| Borde | `#e5e6e6` | Bordes de cards, tablas, inputs |
| Gris header | `#bcbebd` | Encabezados de tabla, labels de filtro, íconos inactivos |
| Texto muted | `#6b7271` | Descripciones, metadatos, placeholders |

### Semánticos (iguales en light y dark)

| Nombre | Hex | Uso |
|--------|-----|-----|
| Éxito | `#5cc49f` | Aprobado, activo, switch encendido, paso completado |
| Alerta | `#ffb054` | Pendiente, observado, avisos, consumo remoto |
| Error | `#dc6d6d` | Rechazado, vencido, eliminar, montos negativos |

Fondos al 10 % (`bg-[#5cc49f]/10`), bordes al 30 % (`border-[#5cc49f]/30`).

### Equivalencias light → dark

| Rol | Light | Dark |
|-----|-------|------|
| Canvas de página | `#fbfbfc` / `#ffffff` | `#041a34` |
| Card / modal | `#ffffff` | `#052850` |
| Wizard pantalla completa | `#ffffff` | `#041a34` |
| Botón primario | `bg-[#052850] text-white` | `bg-[#c1d6f5] text-[#052850]` |
| Superficie de tabs / pills | `#eff0f0` | `white/5` |
| Toolbar / header de tabla | `#fbfbfc` | `white/[0.02]` |
| Borde | `#e5e6e6` | `white/10` |
| Texto muted | `#6b7271` | `white/50` |
| Hover / fila seleccionada | `#eff6ff` | `white/5` · `#c1d6f5/[0.07]` |
| Foco de input | `border-[#052850]` | `border-[#c1d6f5]` |

> El primario en dark **ya no** es `bg-blue-600`; se invierte a celeste con texto navy.

### Colores de producto

Definidos en `PRODUCTOS_BRAND` (`src/app/core/models/cliente-expediente.model.ts`). Solo tiñen piezas del producto contratado (tab activo del expediente, tarjeta física, logos), nunca la UI general.

| Producto | Primario light | Primario dark | Acento |
|----------|---------------|---------------|--------|
| CNG+ | `#052850` | `#c1d6f5` | `#DE4C2E` |
| TAP Combustible | `#242424` | `#C4FF35` | `#C4FF35` |
| TAP Despensa | `#7A004E` | `#F9A1D5` | `#F9A1D5` |
| Compras | `#FE6B1B` | `#FFC4A4` | `#FFC4A4` |

### Tokens CSS

En `src/styles/theme.css` (`--background`, `--foreground`, `--primary`, `--secondary`, `--muted`, `--border`, `--card`, `--ring`, `--radius: 1rem`…). Dark mode con la clase `.dark` en `<html>` (la pone `ThemeService`) y la variante `@custom-variant dark (&:is(.dark *))`.

---

## Tipografía — Helvetica Neue

| Rol | Clases |
|-----|--------|
| Título de página | `text-[32px] font-bold tracking-tight font-['Helvetica_Neue']` |
| Monto KPI | `text-[24px] font-bold tracking-tight` |
| Título de wizard | `text-[22px] font-bold tracking-tight` |
| Título de card / modal | `text-[16px] font-bold` |
| Cuerpo / descripción de página | `text-[14px]` (muted) |
| Celda / texto de modal | `text-[12px]`–`text-[13px]` |
| Label de campo | `text-[12px] font-bold` (sin uppercase) |
| Label de sección | `text-[12px] font-bold uppercase tracking-widest` |
| Caption / header de tabla | `text-[10px] font-bold uppercase tracking-wider` (`#bcbebd` en tablas) |

Las clases heredadas `.ds-h1` (24px medium), `.ds-h2`, `.ds-cuerpo`, `.ds-pequeno`, `.ds-pie` siguen en `src/styles/fonts.css`, pero lo nuevo usa las utilidades de arriba.

---

## Geometría

| Radio | Uso |
|-------|-----|
| `rounded-[32px]` | Contenedor de tabla, modal, wizard |
| `rounded-[24px]` | Card, KPI, barra de filtros |
| `rounded-2xl` (16px) | Dropdown, aviso/banner, sub-card |
| `rounded-[14px]` | Input premium y campos de modal |
| `rounded-[10px]` | Fondo de ícono |
| `rounded-full` | Botones, tabs, pills, badges, buscador |

---

## Layout de página

- `DashboardLayout` envuelve cada página en `.page-container py-6` (padding lateral 5rem / 2rem en móvil, máx. 1800px). No agregar padding al root de la página.
- Root típico: `space-y-6 pb-20 animate-in fade-in slide-in-from-bottom-4 duration-500`.
- Orden: **Header** (título 32px + descripción + acciones) → **tabs del módulo** → **KPIs** (`grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4`) → **segmentos + barra de filtros** → **tabla** → **total de la vista** → **barra de selección**.
- Los modales se declaran al final del template, fuera del contenedor animado, con `@if`.

---

## Botones

Siempre `rounded-full font-bold`, ícono de 14–16px con `gap-2`.

```html
<!-- Primario -->
class="bg-[#052850] text-white dark:bg-[#c1d6f5] dark:text-[#052850] rounded-full font-bold px-6 py-3 text-[13px] hover:opacity-90 active:scale-95 transition-all flex items-center gap-2"

<!-- Outline -->
light: 'border border-[#052850] text-[#052850] hover:bg-[#052850] hover:text-white'
dark:  'border border-white/10 text-white hover:bg-white/5'

<!-- Secundario -->
light: 'bg-[#eff0f0] text-[#052850] hover:bg-[#e5e6e6]'   dark: 'bg-white/10 text-white hover:bg-white/15'

<!-- Texto (Cancelar en footers) -->
light: 'text-[#6b7271] hover:bg-[#eff0f0]'   dark: 'text-white/70 hover:bg-white/10'

<!-- Destructivo / Aprobar -->
'bg-[#dc6d6d] text-white'  ·  'bg-[#5cc49f] text-white'

<!-- Deshabilitado -->
'opacity-40 cursor-not-allowed' + superficie gris
```

| Tamaño | Clases |
|--------|--------|
| Header de página | `px-6 py-3 text-[13–14px]` |
| Footer de modal | `px-6 py-2.5 text-[13px]` |
| Toolbar / filtros | `h-10 px-5 text-[13px]` |
| Chip / atajo | `px-4 py-2 text-[12px]` |

### Solo ícono

- **Toolbar de tabla:** `p-2.5 rounded-full border text-[#6b7271]` (o `w-10 h-10 rounded-full border`) + `appTooltip` + `aria-label`. **Sin texto.**
- **Acciones de fila:** `p-2 rounded-xl`, hover `bg-[#eff0f0]`; la destructiva se tiñe de rojo solo en hover (`hover:bg-[#dc6d6d]/10 hover:text-[#dc6d6d]`).
- **Ghost redondo:** `w-11 h-11 rounded-full bg-[#eff0f0] dark:bg-white/5`.
- **Cerrar modal:** `p-2 rounded-full` con ícono `x` de 18px.

---

## Navegación interna

Todas las pestañas son un grupo de pills: contenedor `inline-flex gap-1 p-1 rounded-full bg-[#eff0f0] dark:bg-white/5`, tab activo `bg-[#052850] text-white dark:bg-[#c1d6f5] dark:text-[#052850]`.

| Patrón | Componente | Cuándo |
|--------|-----------|--------|
| Tabs de módulo con contador | `app-cxp-tabs`, `app-bancos-tabs`, `app-cxc-tabs` | Cada tab es una ruta del módulo. Contador neutro, oculto si es 0 |
| Toggle de sub-vista | `app-view-toggle` (shared) | Cambiar filas dentro de la misma ruta (Hoy/Histórico). Badge rojo = pendientes |
| Segmentos con conteo | inline en la página (p. ej. CxP bandeja) | Filtrar la tabla por segmento |
| Tabs del expediente | `cliente-expediente-page` | Tab activo con `.btn-producto` (color del producto contratado) |
| Tabs con paso bloqueado | `app-fase-editor-tabs` (shared) | Tab no disponible: candado + tooltip, no se oculta |

> "Agregar al menú" desde una pantalla casi siempre significa un tab interno, no el nav global. El nav global vive duplicado en `mega-menu` y `dashboard-layout`.

---

## Formularios y filtros

| Elemento | Especificación |
|----------|---------------|
| **Input premium** (`.input-premium` / `.input-premium-label`, `src/styles/theme.css`) | 56px alto, radio 14px, padding 20px, 15px/500. Foco `#3b82f6` (light) / `#c1d6f5` (dark). `select` con chevron propio; `textarea` min 120px |
| **Campo de modal** | `h-[56px] px-5 rounded-[14px] border text-[14px]`, fondo `#f3f3f5` / `white/5`, foco `#052850` / `#c1d6f5`. Label `text-[12px] font-bold mb-2`; lo opcional en el propio label con `opacity-60` |
| **Atajos** | Chips `px-4 py-2 rounded-full text-[12px]` bajo el input (Mañana, +7 días…) |
| **Buscador de tabla** | `h-10 pl-11 pr-4 rounded-full border text-[14px]`, ícono `search` 16px a `left-4`, contenedor `max-w-sm` |
| **Rango de fechas** | `app-filtro-rango-fechas` (shared) — emite `fechaInicioChange` / `fechaFinChange` |
| **Switch** | `app-switch` (shared) — pista verde activo, emite `(cambio)` |
| **Checkbox** | Nativo `w-4 h-4 rounded accent-[#052850] dark:accent-[#c1d6f5]` |
| **Barra de filtros** | `app-barra-filtros` (shared) — fuera de la tabla, encima del card; borrador propio que solo filtra al presionar **Buscar**. Campos `CampoFiltro[]` (`select` \| `date`), opciones con `opcionesDe()` |

### Desplegables a medida

Para opciones con logo, ícono, metadatos o selección múltiple — en lugar de `<select>` nativo.

- Patrón: `signal abierto` + `@HostListener('document:click')` para cerrar al hacer click fuera.
- Panel: `absolute z-20 mt-1.5 rounded-2xl border shadow-lg py-1.5 animate-in fade-in zoom-in-95 duration-150`, fondo `white` / `#052850`.
- Opción activa: fondo `#eff6ff` / `white/10` + ícono `check`.
- **Selección única** (formulario): botón con `.input-premium`. Referencia: `select-cuenta-bancaria`, `select-banco`, `select-beneficiario-stp`.
- **Filtro múltiple** (toolbar): botón `h-10 pl-4 pr-3 rounded-full border text-[13px] font-bold`; relleno navy cuando hay filtro activo + contador; header del panel con "Limpiar"; checkboxes `w-[18px] h-[18px] rounded-[6px]`. Referencia: `cxp-filtro-categorias`, `cxc-filtro-estados`.

> Si un filtro tiene más de 2–3 opciones va en desplegable, no en una fila de chips. Al pedir un control nuevo en una toolbar, se agrega junto al existente, no encima.

---

## Badges

Base: `px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider`. El color sale de un `BadgeTone` (`success | warning | error | info | neutral`), nunca se elige a mano por pantalla.

| Componente | Uso |
|-----------|-----|
| `app-badge-estado-movimiento` (bancos) | Genérico para cualquier enum (movimientos, CxP, CxC, STP). Recibe `tone` + `label` ya resueltos; `size="sm"` para tablas densas |
| `app-estado-badge` (shared) | Estado del expediente del alta. Resuelve etiqueta y tono con `estadoTone()`; lleva borde al 30 % |
| `app-status-badge` (cumplimiento) | Heredado de la revisión documental |

Etiquetas auxiliares:

- **Producto / monedero:** `px-2 py-0.5 rounded-md text-[9px] font-bold border`, fondo `#fbfbfc` (`app-cxp-producto-badge`).
- **Marca bajo un ID** (p. ej. "Remoto"): `px-2 py-0.5 rounded-full text-[9px]` en tono alerta.
- **Badge con ícono** (p. ej. Validación IA): `inline-flex items-center gap-1` + ícono 11px.
- **Contadores:** `text-[10px] font-black px-1.5 py-0.5 rounded-full` neutro en tabs/segmentos; rojo (`bg-[#dc6d6d] text-white`) solo para pendientes.

---

## Indicadores y tarjetas

| Componente | Descripción |
|-----------|-------------|
| `app-cxp-kpi-card` | KPI de 24px. Tonos `neutro · positivo · negativo · alerta` (solo los semánticos tiñen el monto y el fondo del ícono). `[clicable]` lo convierte en filtro; activo = borde + `ring-1` navy y etiqueta "Filtrando" |
| `app-stp-tarjeta-saldo` | Tarjeta compacta de saldo (22px) con ícono 14px; tonos `neutro · positivo · negativo` |
| `app-expediente-resumen-card` (shared) | Cabecera de Cumplimiento, Formalización y Dirección: avatar de iniciales + grid de 4 datos |
| `app-tarjeta-visual` (shared) | Tarjeta física con arte del producto; gira en 3D al capturar NIP fijo |
| Total de la vista | Card `rounded-[24px] p-6` bajo la tabla con label uppercase y montos 18px; solo si hay filas |
| `app-premium-stat-card`, `app-info-item` | Heredados de Cumplimiento; para pantallas nuevas usar `app-cxp-kpi-card` |

Card estándar: `rounded-[24px] border p-6`, `bg-white border-[#e5e6e6]` / `bg-[#052850] border-white/10`.
Fondo de ícono: `bg-[#eff6ff] dark:bg-white/10 p-2 rounded-[10px] text-[#052850] dark:text-[#c1d6f5]`.
Avatar de iniciales: `size-8 rounded-full text-[10px] font-bold`, `bg-[#052850] text-white` / `bg-[#c1d6f5] text-[#052850]`.

---

## Tablas de listado

### Contenedor

```html
<div [class]="'rounded-[32px] border overflow-hidden ' +
  (themeService.darkMode() ? 'bg-[#052850]/20 border-white/10' : 'bg-white border-[#e5e6e6] shadow-sm')">
```

### Toolbar (obligatoria en toda tabla de listado)

- **Dentro del contenedor**, nunca en una barra aparte: `p-4 border-b flex items-center justify-between gap-3`, fondo `#fbfbfc` / `white/[0.02]`.
- **Sin título de sección** en la fila — el título de la página ya lo dice.
- **Izquierda:** buscador (`relative flex-1 max-w-sm`).
- **Derecha:** conteo (`text-[12px] font-bold` muted, p. ej. "24 facturas") + botón de descarga circular:

```html
<button appTooltip="Exportar vista actual" aria-label="Exportar vista actual"
  [class]="'p-2.5 rounded-full border text-[#6b7271] transition-colors ' +
    (themeService.darkMode() ? 'border-white/10 hover:bg-white/5' : 'border-[#e5e6e6] hover:bg-white')">
  <app-icon name="download" [size]="18"></app-icon>
</button>
```

  El `[size]` del ícono de descarga coincide con el del ícono de búsqueda de esa tabla (16 o 18).
- Otras acciones de toolbar: solo ícono + `appTooltip`. Filtros con muchas opciones: desplegable.

### Columnas y filas

- Header: `bg-[#fbfbfc] dark:bg-white/[0.02]`, `px-4 py-4 text-[10px] font-bold uppercase tracking-wider text-[#bcbebd]`.
- Divisores: `divide-y divide-[#e5e6e6] dark:divide-white/10` (o `#eff0f0`).
- Fila: `group transition-colors hover:bg-[#eff6ff]/30 dark:hover:bg-white/[0.02]`; seleccionada `bg-[#eff6ff]` / `bg-[#c1d6f5]/[0.07]`.
- Celdas `px-4 py-4`; IDs/folios `text-[13px] font-bold`; montos a la derecha y en bold; fechas y secundarios `text-[12px]` muted.
- Tablas anchas: `overflow-x-auto` + `min-w-[…px]` en la `<table>`.

### Selección y acciones

- Checkbox en la primera columna (`w-12`), "seleccionar todas" en el header.
- Columna **Acciones** fija: `sticky right-0 z-10 border-l` con fondo sólido (`bg-white group-hover:bg-[#fbfbfc]` / `bg-[#052850] group-hover:bg-[#063061]`).
- Íconos de acción con **`appTooltip`** (directiva en `shared/tooltip`). El patrón anterior `relative group/tip` + `<span>` absoluto aún existe en módulos viejos; no usarlo en lo nuevo (lo recorta el `overflow-x-auto`).
- Al seleccionar filas aparece `app-cxp-barra-seleccion` / `app-cxc-barra-seleccion`: pill navy `sticky bottom-4` con cantidad, total y acciones (`AccionSeleccion[]`, variantes `primary` | `outline`). La acción solo existe cuando se puede ejecutar — no hay botones deshabilitados permanentes.

### Estado vacío

```html
<div class="flex flex-col items-center justify-center py-20 px-6 text-center">
  <div class="bg-[#eff6ff] dark:bg-white/5 p-4 rounded-2xl mb-4 text-[#052850] dark:text-[#c1d6f5]">
    <app-icon name="file-text" [size]="28"></app-icon>
  </div>
  <p class="text-[15px] font-bold text-[#052850] dark:text-white">Nada por pagar aquí</p>
  <p class="text-[13px] text-[#6b7271] dark:text-white/50 mt-1 max-w-sm">Ajusta los filtros…</p>
</div>
```

Ejemplos canónicos: `tabla-cxp-bandeja`, `tabla-cxc-cobros`, `soporte-consumos-page`, `gestion-empleados-page`.

---

## Feedback

| Pieza | Especificación |
|-------|---------------|
| **Toast** | `ToastService.show(msg, 'success' \| 'error' \| 'info')` — esquina inferior derecha, 3.5 s, `rounded-[18px]` con borde semántico. Para resultados que no necesitan pantalla propia |
| **Tooltip** | `appTooltip="Texto"` — se monta en `body`, sale arriba (abajo si no cabe), `rounded-lg text-[10px] font-bold`, navy / celeste |
| **Aviso en modal/form** | `rounded-[16px] p-4 flex gap-3` + fondo semántico al 10 %, ícono 18px (`alert-triangle`, `x-circle`, `check-circle`, `info`), texto `text-[12px]` muted. Info usa `#eff6ff` / `white/5` |
| **Éxito** | `app-success-confirmation-modal` — popup que se cierra solo (~1.5 s); para cierres de flujo |
| **Eliminar** | `app-modal-confirmar-eliminar` (facturas) — toda acción destructiva pasa por aquí; `[pedirMotivo]` para exigir motivo |
| **PIN** | `app-pin-verification-modal` — código de 4 dígitos tipo OTP para operaciones sensibles |

---

## Modales y wizards

```html
<!-- Overlay: click fuera cierra -->
<div class="fixed inset-0 z-[100] bg-[#052850]/40 backdrop-blur-sm flex items-center justify-center p-4" (click)="cerrar.emit()">
  <!-- Contenedor -->
  <div (click)="$event.stopPropagation()"
    [class]="'w-full max-w-lg rounded-[32px] flex flex-col max-h-[90vh] overflow-hidden animate-in fade-in zoom-in-95 duration-200 ' +
      (themeService.darkMode() ? 'bg-[#052850] border border-white/10' : 'bg-white border border-[#e5e6e6]')">
    <!-- Header: px-8 py-6 border-b · título 16px bold + subtítulo 12px muted · botón x -->
    <!-- Body:   overflow-y-auto p-8 space-y-6 -->
    <!-- Footer: px-8 py-5 border-t flex justify-end gap-3 · Cancelar (texto) + primario -->
  </div>
</div>
```

- Ancho: `max-w-lg` (formulario corto) → `max-w-4xl` (detalle).
- **Wizard grande** (`wizard-crear-viaje`): `sm:max-w-7xl sm:rounded-[32px] sm:max-h-[94vh]`, pantalla completa en móvil, fondo `#041a34` en dark. Header con título 22px + "Paso N de M · título" + barra segmentada `h-2 flex-1 rounded-full` (verde = completado, navy/celeste = actual, gris = pendiente).
- **Wizard compacto** (`app-carga-masiva`, 3 pasos): barra `h-1.5` sobre el contenido.
- **Stepper de fases del alta** (`app-flujo-stepper`): círculos `size-10` por fase; observado = ámbar, rechazado = rojo.
- Estado de wizards en un store dedicado (`wizard-viaje.store.ts`, `wizard-autorizacion.store.ts`).

---

## Componentes compartidos (`src/app/components/shared/`)

| Componente | Selector | Propósito |
|-----------|----------|-----------|
| barra-filtros | `app-barra-filtros` | Barra de filtros con borrador + Buscar |
| carga-masiva | `app-carga-masiva` | Wizard CSV de 3 pasos parametrizado por `ConfigMasiva` |
| tabla-preview-masiva | `app-tabla-preview-masiva` | Vista previa editable de filas CSV |
| estado-badge | `app-estado-badge` | Badge de estado del expediente |
| expediente-resumen-card | `app-expediente-resumen-card` | Cabecera con datos clave del expediente |
| fase-editor-tabs | `app-fase-editor-tabs` | Tabs Documentación / Formalización con bloqueo |
| filtro-rango-fechas | `app-filtro-rango-fechas` | Rango Desde/Hasta |
| flujo-stepper | `app-flujo-stepper` | Stepper de las 4 fases del alta |
| pin-verification-modal | `app-pin-verification-modal` | Verificación por PIN de 4 dígitos |
| success-confirmation-modal | `app-success-confirmation-modal` | Popup de éxito auto-cerrable |
| switch | `app-switch` | Switch on/off |
| tarjeta-visual | `app-tarjeta-visual` | Tarjeta física con giro 3D |
| tooltip | `[appTooltip]` (directiva) | Tooltip flotante para botones de solo ícono |
| view-toggle | `app-view-toggle` | Toggle de sub-vistas |

Componentes de módulo reutilizables fuera de su módulo: `app-badge-estado-movimiento`, `app-stp-tarjeta-saldo`, `select-*` (bancos); `app-cxp-kpi-card`, `app-cxp-barra-seleccion` (CxP); `app-modal-confirmar-eliminar`, `modal-ver-factura` (facturas). Si se reutilizan en un tercer módulo, considerar moverlos a `shared/`.

---

## Utilidades CSS globales (`src/styles/`)

| Clase | Archivo | Uso |
|-------|---------|-----|
| `.input-premium`, `.input-premium-label` | `theme.css` | Inputs de formulario |
| `.page-container` | `theme.css` | Contenedor de página del layout |
| `.nav-liquid-glass`, `.nav-liquid-glass-dark` | `theme.css` | Nav con vidrio esmerilado al hacer scroll |
| `.liquid-glass-overlay` | `theme.css` | Blur de overlays |
| `.bg-drift` | `theme.css` | Fondo animado (login) |
| `.no-scrollbar` | `fonts.css` | Scroll horizontal sin barra (tabs) |
| `.ds-h1` … `.ds-pie` | `fonts.css` | Escala tipográfica heredada |

---

## Versión React (secundaria)

46 componentes Radix + CVA en `src-react/app/components/ui/` (button, badge, card, dialog, drawer, input, select, tabs, tooltip, etc.), con los mismos tokens en `src-react/styles/theme.css` y animaciones con `motion/react`. Solo se modifica con instrucción explícita.
