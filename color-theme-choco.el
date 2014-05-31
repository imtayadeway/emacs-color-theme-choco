(defun color-theme-choco ()
  "Choco theme. Converted from the textMate theme by imtayadeway"
  (interactive)
  (color-theme-install
   '(color-theme-choco
     ((background-color . "#221612")
      (foreground-color . "#C3BE98")
      (background-mode . dark)
      (border-color . "#361F1A")
      (cursor-color . "#A7A7A7")
)
     (mode-line ((t (:foreground "#F8F8F8" :background "#0E2231"))))
     (region ((t (:background "#636368"))))
     (border ((t (:background "#361f1a" ))))
     (trailing-whitespace ((t (:background "#524949"))))
     (whitespace-trailing ((t (:background "#524949"))))
     (hl-line ((t (:background "#361f1a" ))))
     (linum ((t (:background "#361f1a" ))))
     (match ((t (:foreground "#f8f8f8" :background "#253b22" ))))
     (menu ((t (:foreground "#c3be98" :background "#180c0c" ))))

     ;; font-lock
     (font-lock-comment-face ((t (:foreground "#679D47" :background "#172013" :italic t))))
     (font-lock-constant-face ((t (:foreground "#D77261"))))
     (font-lock-builtin-face ((t (:foreground "#A8799C"))))
     (font-lock-function-name-face ((t (:foreground "#6D4C2F"))))
     (font-lock-variable-name-face ((t (:foreground "#7989A6"))))
     (font-lock-keyword-face ((t (:foreground "#B3935C"))))
     (font-lock-string-face ((t (:foreground "#7CA563"))))
     (font-lock-doc-string-face ((t (:foreground "#DDF2A4"))))
     (font-lock-type-face ((t (:foreground "#A8799C"))))
     (font-lock-number-face ((t (:foreground "#DA5659"))))

     ;; css
     (css-property ((t (:foreground "#af977b" ))))
     (css-proprietary-property ((t (:foreground "#af977b" ))))
     (css-selector ((t (:foreground "#7690a4" ))))

     ;; git
     (diff-added ((t (:foreground "#f8f8f8" :background "#253b22" ))))
     (diff-changed ((t (:foreground "#f8f8f8" :background "#4a410d" ))))
     (diff-header ((t (:foreground "#f8f8f8" :italic t :background "#0e2231" ))))
     (diff-hunk-header ((t (:foreground "#f8f8f8" :italic t :background "#0e2231" ))))
     (diff-removed ((t (:foreground "#f8f8f8" :background "#420e09" ))))

     ;; org-mode
     (org-agenda-dimmed-todo-face ((t (:foreground "#679d47" :background "#180c0c" ))))
     (org-column ((t (:background "#361f1a" ))))
     (org-column-title ((t (:background "#361f1a" ))))
     (org-done ((t (:foreground "#f8f8f8" :background "#253b22" ))))
     (org-hide ((t (:foreground "#180c0c" ))))
     (org-todo ((t (:foreground "#f8f8f8" :background "#462543" ))))
     (org-upcoming-deadline ((t (:foreground "#d2a8a1" :italic t :underline t ))))
     (org-warning ((t (:foreground "#f8f8f8" :background "#462543" ))))

     )))

(provide 'color-theme-choco)
