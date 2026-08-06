{...}:{
  home.file.".config/noctalia/templates/beeper.css".text = ''
    /* === ROOT VARIABLES (DEFAULT / LIGHT MODE) === */
    :root {
        /* Font and Layout Variables */
        --font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI",
            "Helvetica Neue", sans-serif;

        --header-height: 48px;
        --filters-pane-width: 220px;
        --min-sidebar-width: 280px;
        --max-sidebar-width: 800px;
        --threads-list-item-height: 54px;

        --pinned-thread-base-size: 64px;
        --pinned-thread-group-img-size: calc(var(--pinned-thread-base-size) / 1.5);
        --pinned-thread-height: calc(
            var(--pinned-thread-base-size) + (var(--pinned-thread-base-size) / 1.4)
        );
        --pinned-thread-width: calc(
            var(--pinned-thread-base-size) + (var(--pinned-thread-base-size) / 2.5)
        );

        /* Base Colors */
        --color-bg: {{ colors.background.default.hex }};
        --color-bg-rgb: {{ colors.background.default.rgb_csv }};
        --color-fg: {{ colors.on_background.default.hex }};
        --color-fg-rgb: {{ colors.on_background.default.rgb_csv }};

        --color-primary: {{ colors.primary.default.hex }};
        --color-primary-rgb: {{ colors.primary.default.rgb_csv }};

        --color-gray-rgb: {{ colors.outline.default.rgb_csv }};

        /* Base Color Tokens */
        --color-base-gray-dark-50: {{ colors.surface_container_highest.dark.hex }};
        --color-base-gray-dark-50-rgb: {{ colors.surface_container_highest.dark.rgb_csv }};
        --color-base-gray-dark-70: {{ colors.surface_container_high.dark.hex }};
        --color-base-gray-dark-70-rgb: {{ colors.surface_container_high.dark.rgb_csv }};
        --color-base-gray-dark-80: {{ colors.surface_container.dark.hex }};
        --color-base-gray-dark-80-rgb: {{ colors.surface_container.dark.rgb_csv }};
        --color-base-black: {{ colors.scrim.default.hex }};
        --color-base-black-rgb: {{ colors.scrim.default.rgb_csv }};
        --color-base-white: {{ colors.surface.default.hex }};
        --color-base-white-rgb: {{ colors.surface.default.rgb_csv }};

        /* Gray Scale */
        --color-base-gray-20: {{ colors.surface_container_lowest.default.hex }};
        --color-base-gray-20-rgb: {{ colors.surface_container_lowest.default.rgb_csv }};
        --color-base-gray-30: {{ colors.surface_container_low.default.hex }};
        --color-base-gray-30-rgb: {{ colors.surface_container_low.default.rgb_csv }};
        --color-base-gray-40: {{ colors.surface_container.default.hex }};
        --color-base-gray-40-rgb: {{ colors.surface_container.default.rgb_csv }};
        --color-base-gray-50: {{ colors.surface_container_high.default.hex }};
        --color-base-gray-50-rgb: {{ colors.surface_container_high.default.rgb_csv }};
        --color-base-gray-60: {{ colors.surface_container_highest.default.hex }};
        --color-base-gray-60-rgb: {{ colors.surface_container_highest.default.rgb_csv }};
        --color-base-gray-70: {{ colors.outline_variant.default.hex }};
        --color-base-gray-70-rgb: {{ colors.outline_variant.default.rgb_csv }};
        --color-base-gray-80: {{ colors.outline.default.hex }};
        --color-base-gray-80-rgb: {{ colors.outline.default.rgb_csv }};
        --color-base-gray-100: {{ colors.on_surface_variant.default.hex }};
        --color-base-gray-100-rgb: {{ colors.on_surface_variant.default.rgb_csv }};
        --color-base-gray-110: {{ colors.on_surface.default.hex }};
        --color-base-gray-110-rgb: {{ colors.on_surface.default.rgb_csv }};
        --color-base-gray-120: {{ colors.on_surface.default.hex }};
        --color-base-gray-120-rgb: {{ colors.on_surface.default.rgb_csv }};

        /* System Blue / Primary Accents */
        --color-base-system-blue-80: {{ colors.primary_fixed_dim.default.hex }};
        --color-base-system-blue-80-rgb: {{ colors.primary_fixed_dim.default.rgb_csv }};
        --color-base-system-blue-90: {{ colors.primary.default.hex }};
        --color-base-system-blue-90-rgb: {{ colors.primary.default.rgb_csv }};
        --color-base-system-blue-100: {{ colors.primary_container.default.hex }};
        --color-base-system-blue-100-rgb: {{ colors.primary_container.default.rgb_csv }};
        --color-base-system-blue-110: {{ colors.on_primary_container.default.hex }};
        --color-base-system-blue-110-rgb: {{ colors.on_primary_container.default.rgb_csv }};

        /* Noctalia Color Palette Tokens */
        --color-accent-primary: {{ colors.primary.default.hex }};
        --color-accent-secondary: {{ colors.secondary.default.hex }};
        --color-accent-tertiary: {{ colors.tertiary.default.hex }};
        --color-accent-error: {{ colors.error.default.hex }};
        --color-surface-dim: {{ colors.surface_dim.default.hex }};
        --color-surface-bright: {{ colors.surface_bright.default.hex }};

        /* Background Colors */
        --color-background-app: var(--color-base-white);
        --color-background-app-weak: var(--color-base-gray-20);
        --color-background-elevated: var(--color-base-white);
        --color-background-elevated-hover: var(--color-base-gray-40);
        --color-background-grouped: var(--color-base-white);
        --color-background-grouped-weak: var(--color-base-gray-30);
        --color-background-object: var(--color-base-gray-30);

        /* Button Backgrounds */
        --color-background-button-primary: var(--color-base-system-blue-90);
        --color-background-button-primary-active: var(--color-base-system-blue-100);
        --color-background-button-primary-disabled: var(
            --color-base-system-blue-80
        );
        --color-background-button-secondary: var(--color-base-white);
        --color-background-button-secondary-active: var(--color-base-gray-20);
        --color-background-button-secondary-disabled: var(--color-base-white);
        --color-background-button-translucent: rgba(
            var(--color-base-black-rgb),
            0.1
        );
        --color-background-button-translucent-active: rgba(
            var(--color-base-black-rgb),
            0.15
        );
        --color-background-button-translucent-disabled: rgba(
            var(--color-base-black-rgb),
            0.05
        );

        /* Sidebar Backgrounds */
        --color-background-sidebar: rgba(var(--color-base-white-rgb), 0.75);
        --color-background-sidebar-opaque: var(--color-base-gray-30);
        --color-background-sidebar-thread-focus: rgba(
            var(--color-base-black-rgb),
            0.1
        );
        --color-background-sidebar-thread-selected: var(
            --color-background-selected-primary
        );
        --color-background-sidebar-thread-selected-unfocused: rgba(
            var(--color-base-black-rgb),
            0.15
        );

        /* Message Backgrounds */
        --color-background-message-active: var(--color-base-gray-20);
        --color-background-message-bubble-received: var(--color-base-gray-40);
        --color-background-message-bubble-sent: var(--color-base-system-blue-90);
        --color-background-message-bubble-linked: var(--color-background-app);

        /* Selected States */
        --color-background-selected-primary: var(--color-base-system-blue-90);
        --color-background-selected-secondary: rgba(
            var(--color-base-black-rgb),
            0.1
        );

        /* Input Backgrounds */
        --color-background-input: var(--color-base-gray-20);
        --color-background-kbd: rgba(var(--color-base-black-rgb), 0.15);

        /* Header and Menu Backgrounds */
        --color-background-header-right: rgba(var(--color-base-white-rgb), 0.9);
        --color-background-header-right-opaque: var(--color-base-white);
        --color-background-menu: rgba(var(--color-base-gray-40-rgb), 0.9);
        --color-background-menu-opaque: var(--color-base-gray-40);
        --color-background-menu-option-hover: var(--color-base-system-blue-90);

        /* Border Colors */
        --color-border-neutrals: var(--color-base-gray-60);
        --color-border-neutrals-strong: var(--color-base-gray-70);
        --color-border-neutrals-weak: var(--color-base-gray-40);
        --color-border-input: var(--color-base-gray-60);
        --color-border-input-active: var(--color-base-gray-80);
        --color-border-translucent: rgba(var(--color-base-black-rgb), 0.1);
        --color-border-translucent-strong: rgba(var(--color-base-black-rgb), 0.15);
        --color-border-translucent-strongest: rgba(
            var(--color-base-black-rgb),
            0.5
        );
        --color-border-translucent-weak: rgba(var(--color-base-black-rgb), 0.05);

        /* Text Colors */
        --color-text-neutrals: var(--color-base-gray-120);
        --color-text-neutrals-subtle: var(--color-base-gray-100);
        --color-text-neutrals-weak: var(--color-base-gray-110);
        --color-text-on-accent: var(--color-base-white);
        --color-text-on-accent-weak: rgba(var(--color-base-white-rgb), 0.7);
        --color-text-translucent: rgba(var(--color-base-black-rgb), 0.9);
        --color-text-translucent-subtle: rgba(var(--color-base-black-rgb), 0.5);
        --color-text-translucent-weak: rgba(var(--color-base-black-rgb), 0.7);

        /* Icon Colors */
        --color-icon-neutrals: var(--color-base-gray-110);
        --color-icon-neutrals-strong: var(--color-base-gray-120);
        --color-icon-neutrals-subtle: var(--color-base-gray-80);
        --color-icon-neutrals-weak: var(--color-base-gray-100);
        --color-icon-on-accent: rgba(var(--color-base-white-rgb), 0.75);
        --color-icon-on-accent-strong: rgba(var(--color-base-white-rgb), 0.9);
        --color-icon-on-accent-weak: rgba(var(--color-base-white-rgb), 0.4);
        --color-icon-translucent: rgba(var(--color-base-black-rgb), 0.6);
        --color-icon-translucent-strong: rgba(var(--color-base-black-rgb), 0.9);
        --color-icon-translucent-subtle: rgba(var(--color-base-black-rgb), 0.3);
        --color-icon-translucent-weak: rgba(var(--color-base-black-rgb), 0.4);

        /* Scrollbar */
        --color-background-scrollbar: rgba(var(--color-base-black-rgb), 0.3);
        --color-background-scrollbar-hover: rgba(var(--color-base-black-rgb), 0.5);

        /* Misc */
        --color-background-tag: rgba(var(--color-base-black-rgb), 0.1);
        --color-overlay-modal: rgba(var(--color-base-black-rgb), 0.4);
        --color-transparent: rgba(var(--color-base-black-rgb), 0);

        /* Pane Backgrounds */
        --left-pane-bg: transparent;
        --right-pane-bg: rgba(var(--color-bg-rgb), 1);

        /* Legacy Variables for Compatibility */
        --mark-bg: {{ colors.tertiary_container.default.hex }};
        --error-color: {{ colors.error.default.hex }};
        --warning-color: {{ colors.secondary.default.hex }};
        --snoozed-indicator-bg: {{ colors.secondary.default.hex }};
        --error-indicator-bg: var(--error-color);
        --message-snoozed-border: {{ colors.secondary.default.hex }};
        --message-errored-beacon: var(--error-color);
        --sms-sent-bg: {{ colors.tertiary.default.hex }};

        /* Audio Bar */
        --compose-message-accent: {{ colors.outline.default.hex }};
        --audio-bar-button: {{ colors.on_surface_variant.default.hex }};
        --audio-bar-preview-progress: {{ colors.on_surface.default.hex }};
        --audio-bar-bg: {{ colors.surface_container_low.default.hex }};
        --audio-bar-border: {{ colors.outline_variant.default.hex }};

        /* Keyboard Keys */
        --key-border: {{ colors.outline_variant.default.hex }};
        --key-bg: linear-gradient(to bottom, {{ colors.surface_container.default.hex }}, {{ colors.surface_container_high.default.hex }});
        --color-key-bottom-bg: {{ colors.outline_variant.default.hex }};

        /* Preferences */
        --prefs-well: rgba({{ colors.scrim.default.rgb_csv }}, 0.02);

        /* Skeleton */
        --skeleton-bg: url("../../../public/img/skeleton.svg");
    }

    /* === USER STYLES === */

    body {
        -webkit-font-smoothing: auto;
        --margin-50: 2px;
        --margin-75: 3px;
        --margin-100: 4px;
        --margin-200: 6px;
        --margin-300: 8px;
        --margin-400: 10px;
        --margin-450: 11px;
        --margin-500: 12px;
        --margin-600: 14px;
        --margin-700: 16px;
        --margin-800: 18px;
        --margin-900: 20px;
        --margin-900: 22px;
        --margin-1000: 24px;
        --margin-1200: 28px;
        --margin-1400: 32px;
        --font-letter-spacing-headline: -0.046875rem;
        --font-letter-spacing-title: 0rem;
        --font-letter-spacing-body: 0.00625rem;
        --font-letter-spacing-label: 0.015625rem;
        --font-letter-spacing-special: 0.0125rem;
        --font-weight-regular: 400;
        --font-weight-emphasized: 600;
        --font-weight-fullscreen: 700;
        --font-size-headline-display: 2.25rem;
        --font-size-headline: 1.75rem;
        --font-headline-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-headline) / var(--font-size-headline-display)
            var(--font-family);
        --font-size-title-small: 1rem;
        --line-height-title-small: 1.25rem;
        --font-title-small-regular: normal var(--font-weight-regular)
            var(--font-size-title-small) / var(--line-height-title-small)
            var(--font-family);
        --font-title-small-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-title-small) / var(--line-height-title-small)
            var(--font-family);
        --font-size-title-medium: 1.0625rem;
        --line-height-title-medium: 1.5rem;
        --font-title-medium-regular: normal var(--font-weight-regular)
            var(--font-size-title-medium) / var(--line-height-title-medium)
            var(--font-family);
        --font-title-medium-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-title-medium) / var(--line-height-title-medium)
            var(--font-family);
        --font-size-title-large: 1.125rem;
        --line-height-title-large: 1.625rem;
        --font-title-large-regular: normal var(--font-weight-regular)
            var(--font-size-title-large) / var(--line-height-title-large)
            var(--font-family);
        --font-title-large-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-title-large) / var(--line-height-title-large)
            var(--font-family);
        --font-size-body-small: 0.8125rem;
        --line-height-body-small: 1rem;
        --font-body-small-regular: normal var(--font-weight-regular)
            var(--font-size-body-small) / var(--line-height-body-small)
            var(--font-family);
        --font-body-small-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-body-small) / var(--line-height-body-small)
            var(--font-family);
        --font-size-body-medium: 0.875rem;
        --line-height-body-medium: 1.125rem;
        --font-body-medium-regular: normal var(--font-weight-regular)
            var(--font-size-body-medium) / var(--line-height-body-medium)
            var(--font-family);
        --font-body-medium-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-body-medium) / var(--line-height-body-medium)
            var(--font-family);
        --font-size-body-large: 0.9375rem;
        --line-height-body-large: 1.25rem;
        --font-body-large-regular: normal var(--font-weight-regular)
            var(--font-size-body-large) / var(--line-height-body-large)
            var(--font-family);
        --font-body-large-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-body-large) / var(--line-height-body-large)
            var(--font-family);
        --font-size-label-xsmall: 0.625rem;
        --line-height-label-xsmall: 0.4375rem;
        --font-label-xsmall-regular: normal var(--font-weight-regular)
            var(--font-size-label-xsmall) / var(--line-height-label-small)
            var(--font-family);
        --font-label-xsmall-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-label-xsmall) / var(--line-height-label-small)
            var(--font-family);
        --font-size-label-small: 0.6875rem;
        --line-height-label-small: 0.875rem;
        --font-label-small-regular: normal var(--font-weight-regular)
            var(--font-size-label-small) / var(--line-height-label-small)
            var(--font-family);
        --font-label-small-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-label-small) / var(--line-height-label-small)
            var(--font-family);
        --font-size-label-medium: 0.75rem;
        --line-height-label-medium: 0.9375rem;
        --font-label-medium-regular: normal var(--font-weight-regular)
            var(--font-size-label-medium) / var(--line-height-label-medium)
            var(--font-family);
        --font-label-medium-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-label-medium) / var(--line-height-label-medium)
            var(--font-family);
        --font-size-label-large: 0.8125rem;
        --line-height-label-large: 1rem;
        --font-label-large-regular: normal var(--font-weight-regular)
            var(--font-size-label-large) / var(--line-height-label-large)
            var(--font-family);
        --font-label-large-emphasized: normal var(--font-weight-emphasized)
            var(--font-size-label-large) / var(--line-height-label-large)
            var(--font-family);
        --font-size-special-link: 0.875rem;
        --line-height-special-link: 1.25rem;
        --font-special-link-regular: normal var(--font-weight-regular)
            var(--font-size-special-link) / var(--line-height-special-link)
            var(--font-family);
        --font-line-height-large: 1.125rem;
        --font-line-height-medium: 1rem;
        --font-line-height-small: 0.9375rem;
        --font-line-height-xsmall: 0.875rem;
        --font-line-height-xxsmall: 0.75rem;
        --font-size-emoji: 3rem;
        --inbox-avatar-size: 28px;
        --cv-avatar-size: 28px;
        --set-selector-icon-size: 32px;
        --inbox-icon-size: 20px;
        --inbox-search-icon-size: 15px;
        --border-radius-25: 4px;
        --border-radius-6: 6px;
        --border-radius-50: 8px;
        --border-radius-75: 10px;
        --border-radius-100: 12px;
        --border-radius-200: 20px;
        --border-radius-conversation-bubble: 17px;
        --inbox-filter-size: 40px;
        --account-switcher-brand-icon-size: 20px;
        --account-switcher-width: 54px;
        --min-media-width: 40px;
        --composer-attachment-min-width: 180px;
        --composer-attachment-max-width: 240px;
        --composer-attachment-max-height: 66px;
        --divider-height: 0.33px;
        --divider-opacity: 0.2;
        --composer-link-preview-width: 180px;
        --prefs-avatar-height: 130px;
        --message-padding-horizontal: 12px;
        --message-padding-vertical: 5px;
    }

    /* === DARK MODE OVERRIDES === */
    @media (prefers-color-scheme: dark) {
        :root {
            /* Base Colors - Dark */
            --color-bg: {{ colors.background.dark.hex }};
            --color-bg-rgb: {{ colors.background.dark.rgb_csv }};
            --color-fg: {{ colors.on_background.dark.hex }};
            --color-fg-rgb: {{ colors.on_background.dark.rgb_csv }};

            --color-primary: {{ colors.primary.dark.hex }};
            --color-primary-rgb: {{ colors.primary.dark.rgb_csv }};

            /* Gray Scale - Dark */
            --color-base-gray-10: {{ colors.surface_container_lowest.dark.hex }};
            --color-base-gray-10-rgb: {{ colors.surface_container_lowest.dark.rgb_csv }};
            --color-base-gray-20: {{ colors.surface_container_low.dark.hex }};
            --color-base-gray-20-rgb: {{ colors.surface_container_low.dark.rgb_csv }};
            --color-base-gray-30: {{ colors.surface_container.dark.hex }};
            --color-base-gray-30-rgb: {{ colors.surface_container.dark.rgb_csv }};
            --color-base-gray-40: {{ colors.surface_container_high.dark.hex }};
            --color-base-gray-40-rgb: {{ colors.surface_container_high.dark.rgb_csv }};
            --color-base-gray-50: {{ colors.surface_container_highest.dark.hex }};
            --color-base-gray-50-rgb: {{ colors.surface_container_highest.dark.rgb_csv }};
            --color-base-gray-60: {{ colors.outline_variant.dark.hex }};
            --color-base-gray-60-rgb: {{ colors.outline_variant.dark.rgb_csv }};
            --color-base-gray-70: {{ colors.outline.dark.hex }};
            --color-base-gray-70-rgb: {{ colors.outline.dark.rgb_csv }};
            --color-base-gray-80: {{ colors.surface_bright.dark.hex }};
            --color-base-gray-80-rgb: {{ colors.surface_bright.dark.rgb_csv }};
            --color-base-gray-85: {{ colors.surface_variant.dark.hex }};
            --color-base-gray-85-rgb: {{ colors.surface_variant.dark.rgb_csv }};
            --color-base-gray-90: {{ colors.on_surface_variant.dark.hex }};
            --color-base-gray-90-rgb: {{ colors.on_surface_variant.dark.rgb_csv }};
            --color-base-gray-100: {{ colors.on_surface_variant.dark.hex }};
            --color-base-gray-100-rgb: {{ colors.on_surface_variant.dark.rgb_csv }};
            --color-base-gray-110: {{ colors.on_surface.dark.hex }};
            --color-base-gray-110-rgb: {{ colors.on_surface.dark.rgb_csv }};
            --color-base-gray-120: {{ colors.on_surface.dark.hex }};
            --color-base-gray-120-rgb: {{ colors.on_surface.dark.rgb_csv }};

            /* System Blue - Dark */
            --color-base-system-blue-80: {{ colors.primary_fixed_dim.dark.hex }};
            --color-base-system-blue-80-rgb: {{ colors.primary_fixed_dim.dark.rgb_csv }};
            --color-base-system-blue-90: {{ colors.primary.dark.hex }};
            --color-base-system-blue-90-rgb: {{ colors.primary.dark.rgb_csv }};
            --color-base-system-blue-100: {{ colors.primary_container.dark.hex }};
            --color-base-system-blue-100-rgb: {{ colors.primary_container.dark.rgb_csv }};
            --color-base-system-blue-110: {{ colors.on_primary_container.dark.hex }};
            --color-base-system-blue-110-rgb: {{ colors.on_primary_container.dark.rgb_csv }};

            /* Noctalia Color Palette Tokens - Dark */
            --color-accent-primary: {{ colors.primary.dark.hex }};
            --color-accent-secondary: {{ colors.secondary.dark.hex }};
            --color-accent-tertiary: {{ colors.tertiary.dark.hex }};
            --color-accent-error: {{ colors.error.dark.hex }};
            --color-surface-dim: {{ colors.surface_dim.dark.hex }};
            --color-surface-bright: {{ colors.surface_bright.dark.hex }};

            /* Background Colors - Dark */
            --color-background-app: var(--color-base-gray-10);
            --color-background-app-weak: var(--color-base-gray-20);
            --color-background-elevated: var(--color-base-gray-30);
            --color-background-elevated-hover: var(--color-base-gray-50);
            --color-background-grouped: var(--color-base-gray-20);
            --color-background-grouped-weak: var(--color-base-gray-10);
            --color-background-object: var(--color-base-gray-30);

            /* Button Backgrounds - Dark */
            --color-background-button-primary: var(--color-base-system-blue-90);
            --color-background-button-primary-active: var(
                --color-base-system-blue-100
            );
            --color-background-button-primary-disabled: var(
                --color-base-system-blue-80
            );
            --color-background-button-secondary: var(--color-base-gray-80);
            --color-background-button-secondary-active: var(--color-base-gray-90);
            --color-background-button-secondary-disabled: var(--color-base-gray-70);
            --color-background-button-translucent: rgba(
                var(--color-base-white-rgb),
                0.1
            );
            --color-background-button-translucent-active: rgba(
                var(--color-base-white-rgb),
                0.15
            );
            --color-background-button-translucent-disabled: rgba(
                var(--color-base-white-rgb),
                0.05
            );

            /* Sidebar Backgrounds - Dark */
            --color-background-sidebar: rgba(var(--color-base-gray-40-rgb), 0.6);
            --color-background-sidebar-opaque: var(--color-base-gray-30);
            --color-background-sidebar-thread-focus: rgba(
                var(--color-base-white-rgb),
                0.1
            );
            --color-background-sidebar-thread-selected: var(
                --color-background-selected-primary
            );
            --color-background-sidebar-thread-selected-unfocused: rgba(
                var(--color-base-white-rgb),
                0.15
            );

            /* Message Backgrounds - Dark */
            --color-background-message-active: var(--color-base-gray-20);
            --color-background-message-bubble-received: var(--color-base-gray-40);
            --color-background-message-bubble-sent: var(
                --color-base-system-blue-90
            );
            --color-background-message-bubble-linked: var(--color-base-gray-20);

            /* Selected States - Dark */
            --color-background-selected-primary: var(--color-base-system-blue-90);
            --color-background-selected-secondary: rgba(
                var(--color-base-white-rgb),
                0.1
            );

            /* Input Backgrounds - Dark */
            --color-background-input: var(--color-base-gray-10);
            --color-background-kbd: rgba(var(--color-base-white-rgb), 0.15);

            /* Header and Menu Backgrounds - Dark */
            --color-background-header-right: rgba(
                var(--color-base-gray-30-rgb),
                0.9
            );
            --color-background-header-right-opaque: var(--color-base-gray-30);
            --color-background-menu: rgba(var(--color-base-gray-30-rgb), 0.9);
            --color-background-menu-opaque: var(--color-base-gray-30);
            --color-background-menu-option-hover: var(--color-base-system-blue-80);

            /* Border Colors - Dark */
            --color-border-neutrals: var(--color-base-gray-60);
            --color-border-neutrals-strong: var(--color-base-gray-70);
            --color-border-neutrals-weak: var(--color-base-gray-40);
            --color-border-input: var(--color-base-gray-60);
            --color-border-input-active: var(--color-base-gray-80);
            --color-border-translucent: rgba(var(--color-base-white-rgb), 0.1);
            --color-border-translucent-strong: rgba(
                var(--color-base-white-rgb),
                0.15
            );
            --color-border-translucent-strongest: rgba(
                var(--color-base-white-rgb),
                0.5
            );
            --color-border-translucent-weak: rgba(
                var(--color-base-white-rgb),
                0.05
            );

            /* Text Colors - Dark */
            --color-text-neutrals: var(--color-base-gray-120);
            --color-text-neutrals-subtle: var(--color-base-gray-100);
            --color-text-neutrals-weak: var(--color-base-gray-110);
            --color-text-on-accent: var(--color-base-white);
            --color-text-on-accent-weak: rgba(var(--color-base-white-rgb), 0.7);
            --color-text-translucent: rgba(var(--color-base-white-rgb), 0.9);
            --color-text-translucent-subtle: rgba(var(--color-base-white-rgb), 0.5);
            --color-text-translucent-weak: rgba(var(--color-base-white-rgb), 0.7);

            /* Icon Colors - Dark */
            --color-icon-neutrals: var(--color-base-gray-110);
            --color-icon-neutrals-strong: var(--color-base-gray-120);
            --color-icon-neutrals-subtle: var(--color-base-gray-80);
            --color-icon-neutrals-weak: var(--color-base-gray-100);
            --color-icon-on-accent: rgba(var(--color-base-white-rgb), 0.75);
            --color-icon-on-accent-strong: rgba(var(--color-base-white-rgb), 0.9);
            --color-icon-on-accent-weak: rgba(var(--color-base-white-rgb), 0.4);
            --color-icon-translucent: rgba(var(--color-base-white-rgb), 0.6);
            --color-icon-translucent-strong: rgba(var(--color-base-white-rgb), 0.9);
            --color-icon-translucent-subtle: rgba(var(--color-base-white-rgb), 0.3);
            --color-icon-translucent-weak: rgba(var(--color-base-white-rgb), 0.4);

            /* Scrollbar - Dark */
            --color-background-scrollbar: rgba(var(--color-base-white-rgb), 0.3);
            --color-background-scrollbar-hover: rgba(
                var(--color-base-white-rgb),
                0.5
            );

            /* Misc - Dark */
            --color-background-tag: rgba(var(--color-base-white-rgb), 0.1);
            --color-overlay-modal: rgba(var(--color-base-black-rgb), 0.4);
            --color-transparent: rgba(var(--color-base-black-rgb), 0);

            /* Audio Bar - Dark */
            --compose-message-accent: {{ colors.outline.dark.hex }};
            --audio-bar-button: {{ colors.on_surface_variant.dark.hex }};
            --audio-bar-preview-progress: {{ colors.on_surface.dark.hex }};
            --audio-bar-bg: {{ colors.surface_container_low.dark.hex }};
            --audio-bar-border: {{ colors.outline_variant.dark.hex }};

            /* Keyboard Keys - Dark */
            --key-border: linear-gradient(to bottom, {{ colors.surface_container_high.dark.hex }}, {{ colors.surface_container.dark.hex }});
            --key-bg: linear-gradient(to bottom, {{ colors.surface_container_high.dark.hex }}, {{ colors.surface_container_lowest.dark.hex }});
            --color-key-bottom-bg: {{ colors.surface_container_low.dark.hex }};

            /* Preferences - Dark */
            --prefs-well: rgba({{ colors.scrim.dark.rgb_csv }}, 0.02);
        }
    }

    /* === TRANSPARENCY OVERRIDES === */
    .no-transparency,
    .reduce-transparency {
        --left-pane-bg: var(--color-background-sidebar-opaque);
        --color-background-header-right: var(
            --color-background-header-right-opaque
        );
        --color-background-menu: var(--color-background-menu-opaque);
    }

  '';
}
