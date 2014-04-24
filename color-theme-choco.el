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
;;      (mouse-color . "#323232")
)
     (mode-line ((t (:foreground "#F8F8F8" :background "#0E2231"))))
     (region ((t (:background "#636368"))))

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
     )))

(provide 'color-theme-choco)
