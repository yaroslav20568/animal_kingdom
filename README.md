# Animal Kingdom

Интерактивная энциклопедия животных в виде книги для мобильных устройств.

## Описание проекта

Animal Kingdom - это мобильное приложение на Flutter, оформленное как интерактивная книга-энциклопедия о животных. Приложение позволяет пользователям открыть виртуальную книгу, листать страницы и изучать информацию о различных животных, включая их описание, среду обитания, рацион питания и продолжительность жизни.

## Что было сделано

- Создана структура проекта с разделением на экраны, виджеты, модели, данные, константы и утилиты
- Реализован экран старта с визуализацией закрытой книги
- Создан экран книги с навигацией между страницами и отображением информации о животных
- Реализован репозиторий с данными о 16 животных из разных категорий
- Добавлена модель данных Animal с полной информацией о животных (название, описание, среда обитания, рацион, продолжительность жизни, категория, изображение)
- Организованы виджеты по экранам: виджеты для стартового экрана и виджеты для экрана книги
- Созданы переиспользуемые виджеты для отображения страниц книги с информацией о животных
- Вынесены все цвета приложения в отдельный файл констант
- Реализована система категорий животных с соответствующими иконками и цветами
- Добавлена тактильная обратная связь при взаимодействии с элементами интерфейса
- Реализован индикатор текущей страницы внизу экрана книги
- Добавлена поддержка планшетов с адаптивным дизайном (изменение размеров шрифтов и отступов)
- Реализована поддержка широких экранов с горизонтальной компоновкой страниц
- Настроено название приложения "Animal Kingdom" для Android
- Добавлена иконка приложения для Android

## Используемые пакеты

- `flutter` - основной фреймворк
- `cupertino_icons` - иконки для iOS стиля
- `flutter_lints` - линтеры для проверки кода (dev dependency)
- `flutter_launcher_icons` - генерация иконок приложения (dev dependency)

## Архитектура

Проект следует принципам SOLID и KISS. Код организован в следующие директории:

- `lib/screens/` - экраны приложения (стартовый экран и экран книги)
- `lib/widgets/` - переиспользуемые виджеты, организованные по экранам
  - `lib/widgets/start_screen/` - виджеты для стартового экрана
  - `lib/widgets/book_screen/` - виджеты для экрана книги
- `lib/models/` - модели данных (Animal)
- `lib/data/` - репозиторий данных о животных
- `lib/constants/` - константы (цвета приложения)
- `lib/utils/` - утилиты (иконки и цвета для категорий животных)

---

# Animal Kingdom

An interactive animal encyclopedia designed as a book for mobile devices.

## Project Description

Animal Kingdom is a Flutter mobile application designed as an interactive animal encyclopedia book. The application allows users to open a virtual book, flip through pages, and explore information about various animals, including descriptions, habitats, diets, and lifespans.

## What Was Done

- Created project structure with separation into screens, widgets, models, data, constants, and utilities
- Implemented start screen with visualization of a closed book
- Created book screen with page navigation and animal information display
- Implemented repository with data about 16 animals from different categories
- Added Animal data model with complete animal information (name, description, habitat, diet, lifespan, category, image)
- Organized widgets by screens: widgets for start screen and widgets for book screen
- Created reusable widgets for displaying book pages with animal information
- Extracted all application colors into a separate constants file
- Implemented animal category system with corresponding icons and colors
- Added haptic feedback for user interface interactions
- Implemented current page indicator at the bottom of the book screen
- Added tablet support with adaptive design (font sizes and padding adjustments)
- Implemented wide screen support with horizontal page layout
- Configured application name "Animal Kingdom" for Android
- Added application icon for Android

## Used Packages

- `flutter` - main framework
- `cupertino_icons` - icons for iOS style
- `flutter_lints` - linters for code checking (dev dependency)
- `flutter_launcher_icons` - application icon generation (dev dependency)

## Architecture

The project follows SOLID and KISS principles. Code is organized into the following directories:

- `lib/screens/` - application screens (start screen and book screen)
- `lib/widgets/` - reusable widgets, organized by screens
  - `lib/widgets/start_screen/` - widgets for start screen
  - `lib/widgets/book_screen/` - widgets for book screen
- `lib/models/` - data models (Animal)
- `lib/data/` - animal data repository
- `lib/constants/` - constants (application colors)
- `lib/utils/` - utilities (icons and colors for animal categories)
