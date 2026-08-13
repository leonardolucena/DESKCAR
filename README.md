# DeskCar

Controle de despesas e manutenção veicular.

**Stack:** Flutter 3.11+ · Dart 3.11+ · Drift (SQLite) · BLoC · go_router · injectable

---

## Funcionalidades

| Módulo | Descrição |
|--------|-----------|
| **Reparos** | Notas de serviço por categoria (óleo, pneus, etc.), busca, edição e custos (peças/trabalho/total) |
| **Papéis** | Multas, seguros, impostos e outros documentos na mesma base de registros |
| **Relatórios** | Filtros por veículo/período, cards resumo, gráficos de despesas e quilometragem (`fl_chart`) |
| **Garagem** | Cadastro de veículos, lembretes de manutenção e detalhe por carro |
| **Configurações** | Tema claro/escuro com persistência local |
| **Lembretes** | Tela reservada (em breve) |

---

## Arquitetura

Organização por **features** com camadas claras:

```
lib/
├── app.dart / main.dart          # Bootstrap e MaterialApp
├── components/                   # Design system (botões, cards, estados, listas)
├── theme/                        # AppTheme, AppColors, AppSurfaceColors
├── constants/                    # Branding, assets, fontes
├── core/
│   ├── database/                 # Drift — schema, migrations, tabelas
│   ├── di/                       # get_it + injectable
│   ├── router/                   # go_router, rotas e transições
│   ├── preferences/              # SharedPreferences (tema)
│   ├── feedback/                 # AppSnackbar
│   └── errors/                   # AppFailure, AppResult
└── features/
    ├── garage/
    ├── repairs/
    ├── papers/
    ├── reports/
    ├── settings/
    └── reminders/
```

Cada feature segue, quando aplicável:

- `domain/` — entidades, repositórios (interfaces)
- `data/` — mappers, implementações Drift
- `presentation/` — pages, widgets, cubits

**Estado:** `flutter_bloc` (Cubits por feature).  
**Navegação:** `go_router` com `ShellRoute` para a bottom bar.  
**Injeção:** `@injectable` + `build_runner`.

---

## Design system

- **Fonte:** Montserrat  
- **Accent:** `#EAAE0E`  
- **Componentes:** `AppElevatedButton`, `AppTextField`, `AppCard`, `AppSegmentedControl`, estados (`AppLoadingState`, `AppEmptyState`, `AppErrorState`)  
- **Feedback:** sempre via `AppSnackbar` (não usar `ScaffoldMessenger` direto)  
- **Cores adaptativas:** `AppSurfaceColors` resolve light/dark/high-contrast por contexto

Convenções detalhadas em `.cursor/rules/deskcar-flutter-conventions.mdc`.

---

## Navegação

### Bottom bar

| Aba | Rota |
|-----|------|
| Reparos | `/repairs` |
| Papéis | `/papers` |
| Relatórios | `/reports` |
| Configurações | `/settings` |

### Rotas empilhadas

| Rota | Uso |
|------|-----|
| `/repairs/add` | Novo/editar serviço |
| `/papers/add` | Novo/editar documento |
| `/garage` | Lista de veículos |
| `/garage/add` | Novo veículo |
| `/cars/:id` | Detalhe do veículo |

### Transições (`AppPageTransitions`)

- **Abas:** fade suave (~280 ms)  
- **Telas empilhadas:** slide lateral + fade  
- **Formulários:** slide de baixo + fade  

---

## UX de listas

Listas longas (Reparos, Papéis, Garagem) usam `AppPaginatedStaggeredListView`:

1. Carrega **15 itens** por vez  
2. Scroll infinito ao chegar perto do fim  
3. Cada lote entra com **animação em cascata** (`AppStaggeredListEntrance`)  
4. Busca desativa a animação e reinicia a paginação  

Constante: `AppListConstants.pageSize = 15`.

---

## Tema claro / escuro

- Alternância em **Configurações → Aparência** (`AppSegmentedControl`)  
- Persistência via `SharedPreferences` (`ThemePreferences`)  
- Estado global: `ThemeCubit`  
- Telas usam `Theme.of(context)` e `AppSurfaceColors` — evitar cores fixas de light mode  

---

## Banco de dados (Drift)

**Schema v3** — SQLite local, offline-first.

| Tabela | Conteúdo |
|--------|----------|
| `vehicles` | Veículos da garagem |
| `service_records` | Reparos e papéis (`type` + `category`) |
| `service_attachments` | Anexos (estrutura pronta) |
| `reminders` | Lembretes por veículo |
| `odometer_readings` | Leituras de odômetro |

Streams (`watchAllRecords`, `watchAllVehicles`) mantêm as listas sincronizadas após gravação.

---

## Como rodar

### Pré-requisitos

- Flutter SDK ≥ 3.11  
- Dart ≥ 3.11  

### Instalação

```bash
flutter pub get
dart run build_runner build
```

> Regenera `app_database.g.dart`, `injection.config.dart` e demais arquivos gerados.

### Executar

```bash
flutter run
```

### Testes e análise

```bash
flutter analyze
flutter test
```

---

## Locale

App configurado para **`pt_BR`** (`intl`, formatação de datas e valores monetários).

---

## Scripts úteis

| Comando | Ação |
|---------|------|
| `dart run build_runner build` | Codegen (Drift + injectable) |
| `dart run build_runner watch` | Codegen em modo watch |
| `flutter pub outdated` | Verificar dependências desatualizadas |

---
