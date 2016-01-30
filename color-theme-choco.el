(defun color-theme-choco ()
  "Choco theme. Converted from the textMate theme by imtayadeway"
  (interactive)
  (color-theme-install
   '(color-theme-choco
     ((background-color . "#180C0C")
      (foreground-color . "#C3BE98")
      (background-mode . dark)
      (border-color . "#361F1A")
      (cursor-color . "#A7A7A7")
      )
     ;; Built-in

     ;; basic coloring
     (border ((t (:background "#361F1A" ))))
     ;; (button)
     ;; (cursor)
     ;; (default)
     ;; (error)
     ;; (escape-glyph)
     ;; (fringe)
     ;; (header-line)
     ;; (highlight)
     (hl-line ((t (:background "#361F1A" ))))
     ;; (lazy-highlight)
     ;; (link)
     ;; (link-visited)
     (match ((t (:foreground "#F8F8F8" :background "#253B22" ))))
     (menu ((t (:foreground "#C3BE98" :background "#180C0C" ))))
     ;; (minibuffer-prompt)
     (mode-line ((t (:foreground "#F8F8F8" :background "#0E2231"))))
     ;; (mode-line-buffer-id)
     ;; (mode-line-inactive)
     (region ((t (:background "#DDF0FF"))))
     ;; (secondary-selection)
     ;; (shadow)
     ;; (success)
     (trailing-whitespace ((t (:background "#524949"))))
     ;; (vertical-border)
     ;; (warning)
     (whitespace-trailing ((t (:background "#524949"))))
     ;; (widget-field)

     ;; font-lock
     (font-lock-builtin-face ((t (:foreground "#A8799C"))))
     ;; (font-lock-comment-delimiter-face)
     (font-lock-comment-face ((t (:foreground "#679D47"))))
     (font-lock-constant-face ((t (:foreground "#DA5659"))))
     ;; (font-lock-doc-face)
     (font-lock-doc-string-face ((t (:foreground "#DDF2A4"))))
     (font-lock-function-name-face ((t (:foreground "#6D4C2F"))))
     (font-lock-keyword-face ((t (:foreground "#B3935C"))))
     ;; (font-lock-negation-char-face)
     (font-lock-number-face ((t (:foreground "#DA5659"))))
     ;; (font-lock-preprocessor-face)
     (font-lock-regexp-grouping-backslash ((t (:foreground "#DDF2A4"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "#DDF2A4"))))
     (font-lock-string-face ((t (:foreground "#7CA563"))))
     (font-lock-type-face ((t (:foreground "#A8799C"))))
     (font-lock-variable-name-face ((t (:foreground "#7989A6"))))
     ;; (font-lock-warning-face)
     ;; (c-annotation-face)

     ;; dired
     ;; (dired-directory)
     ;; (dired-flagged)
     ;; (dired-header)
     ;; (dired-ignored)
     ;; (dired-mark)
     ;; (dired-marked)
     ;; (dired-perm-write)
     ;; (dired-symlink)
     ;; (dired-warning)

     ;; grep
     ;; (grep-context-face)
     ;; (grep-error-face)
     ;; (grep-hit-face)
     ;; (grep-match-face)

     ;; Third-party

     ;; ace-jump-mode
     ;; (ace-jump-face-background)
     ;; (ace-jump-face-foreground)

     ;; ag
     ;; (ag-hit-face)
     ;; (ag-match-face)

     ;; clojure-test-mode
     ;; (clojure-test-failure-face)
     ;; (clojure-test-error-face)
     ;; (clojure-test-success-face)

     ;; cider-repl-mode
     ;; (cider-repl-err-output-face)

     ;; cider-test-mode
     ;; (cider-test-failure-face)
     ;; (cider-test-error-face)
     ;; (cider-test-success-face)

     ;; css
     (css-property ((t (:foreground "#AF977B" ))))
     (css-proprietary-property ((t (:foreground "#AF977B" ))))
     (css-selector ((t (:foreground "#7690A4" ))))

     ;; diff
     (diff-added ((t (:foreground "#F8F8F8" :background "#253B22" ))))
     (diff-changed ((t (:foreground "#F8F8F8" :background "#4A410D" ))))
     (diff-header ((t (:foreground "#F8F8F8" :italic t :background "#0E2231" ))))
     (diff-hunk-header ((t (:foreground "#F8F8F8" :italic t :background "#0E2231" ))))
     (diff-removed ((t (:foreground "#F8F8F8" :background "#420E09" ))))

     ;; flx
     ;; (flx-highlight-face)

     ;; linum mode
     (linum ((t (:background "#361F1A" ))))

     ;; org-mode
     (org-agenda-dimmed-todo-face ((t (:foreground "#679D47" :background "#180C0C" ))))
     (org-column ((t (:background "#361F1A" ))))
     (org-column-title ((t (:background "#361F1A" ))))
     (org-done ((t (:foreground "#F8F8F8" :background "#253B22" ))))
     (org-hide ((t (:foreground "#180C0C" ))))
     (org-level-1 ((t (:foreground "#B3935C" ))))
     (org-level-2 ((t (:foreground "#DDF2A4" ))))
     (org-level-3 ((t (:foreground "#7CA563" ))))
     (org-level-4 ((t (:foreground "#7989A6" ))))
     (org-level-5 ((t (:foreground "#A8799C" ))))
     (org-level-6 ((t (:foreground "#D77261" ))))
     (org-level-7 ((t (:foreground "#6D4C2F" ))))
     (org-level-8 ((t (:foreground "#F9EE98" ))))
     (org-link ((t (:foreground "#D77261" :underline t))))
     (org-todo ((t (:foreground "#F8F8F8" :background "#462543" ))))
     (org-upcoming-deadline ((t (:foreground "#D2A8A1" :italic t :underline t ))))
     (org-warning ((t (:foreground "#F8F8F8" :background "#462543" ))))
     ;; (org-agenda-structure)
     ;; (org-agenda-calendar-event)
     ;; (org-agenda-calendar-sexp)
     ;; (org-agenda-date)
     ;; (org-agenda-date-weekend)
     ;; (org-agenda-date-today)
     ;; (org-agenda-done)
     ;; (org-archived)
     ;; (org-block)
     ;; (org-block-begin-line)
     ;; (org-checkbox)
     ;; (org-code)
     ;; (org-date)
     ;; (org-ellipsis)
     ;; (org-formula)
     ;; (org-headline-done)
     ;; (org-sexp-date)
     ;; (org-scheduled)
     ;; (org-scheduled-previously)
     ;; (org-scheduled-today)
     ;; (org-special-keyword)
     ;; (org-table)
     ;; (org-tag)
     ;; (org-time-grid)
     ;; (org-agenda-dimmed-todo-face)
     ;; (org-agenda-restriction-lock)
     ;; (org-clock-overlay)
     ;; (org-column)
     ;; (org-column-title)
     ;; (org-date-selected)
     ;; (org-document-info)
     ;; (org-document-title)
     ;; (org-drawer)
     ;; (org-footnote)
     ;; (org-latex-and-export-specials)
     ;; (org-mode-line-clock-overrun)

     ;; perspective
     (persp-selected-face ((t (:foreground "#DA5659"))))

     ;; show-paren
     (show-paren-match ((t (:background "#DDF0FF"))))
     (show-paren-mismatch ((t (:foreground "#F8F8F8" :background "#562D56"))))

     ;; term
     ;; (term)
     (term-color-black ((t (:foreground "#180C0C"))))
     (term-color-red ((t (:foreground "#D77261"))))
     (term-color-green ((t (:foreground "#7CA563"))))
     (term-color-yellow ((t (:foreground "#F1E694"))))
     (term-color-blue ((t (:foreground "#7989A6"))))
     (term-color-magenta ((t (:foreground "#A8799C"))))
     (term-color-cyan ((t (:foreground "#AFC4DB"))))
     (term-color-white ((t (:foreground "#C3BE98"))))

     ;; whitespace-mode
     ;; (whitespace-space)
     ;; (whitespace-hspace)
     ;; (whitespace-tab)
     ;; (whitespace-newline)
     ;; (whitespace-trailing)
     (whitespace-line ((t (:background "#FF9C75"))))
     ;; (whitespace-space-before-tab)
     ;; (whitespace-indentation)
     ;; (whitespace-empty)
     ;; (whitespace-space-after-tab)

     ;;;;; yasnippet
     ;; (yas-field-highlight-face)

     )))

(provide 'color-theme-choco)
