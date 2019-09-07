;;; choco-theme.el --- Choco for Emacs.

;; Copyright (C) 2018 Tim Wade

;; Author: Tim Wade <hello@timjwade.com>
;; URL: http://github.com/imtayadeway/emacs-color-theme-choco
;; Version: 0.0.99

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A port of the TextMate theme Choco for Emacs 24+, built on top
;; of the new built-in theme support in Emacs 24.

;;; Credits:

;; Ludvig Widman created the original theme for TextMate on which this port
;; is based.

;;; Code:

(deftheme choco "The Choco color theme")

(defgroup choco-theme nil
  "Choco theme."
  :prefix "choco-theme-"
  :link '(url-link :tag "GitHub" "http://github.com/imtayadeway/emacs-color-theme-choco")
  :tag "Choco theme")

;;;###autoload
(defcustom choco-override-colors-alist '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist."
  :group 'choco-theme
  :type '(alist
          :key-type (string :tag "Name")
          :value-type (string :tag " Hex")))

;;; Color Palette

(defvar choco-default-colors-alist
  '(("choco-fg+2"     . "#FFFFFF")
    ("choco-fg+1"     . "#F8F8F8")
    ("choco-fg"       . "#C3BE98")
    ("choco-fg-1"     . "#AF977B")
    ("choco-fg-2"     . "#BA9C79")
    ("choco-fg-3"     . "#C8A573")
    ("choco-fg-4"     . "#CDA267")
    ("choco-fg-5"     . "#C29863")
    ("choco-fg-6"     . "#B48F62")
    ("choco-fg-7"     . "#B3935C")
    ("choco-fg-8"     . "#9F785B")
    ("choco-bg+6"     . "#5D5454")
    ("choco-bg+5"     . "#A7A7A7")
    ("choco-bg+4"     . "#494949")
    ("choco-bg+3"     . "#4A410D")
    ("choco-bg+2"     . "#0E2231")
    ("choco-bg+1"     . "#172013")
    ("choco-bg"       . "#180C0C")
    ("choco-red+2"    . "#D2A8A1")
    ("choco-red+1"    . "#CF6A4C")
    ("choco-red"      . "#DA5659")
    ("choco-red-1"    . "#C9584F")
    ("choco-red-2"    . "#D77261")
    ("choco-orange+1" . "#E9C062")
    ("choco-orange"   . "#FF9C75")
    ("choco-orange-1" . "#CF7D34")
    ("choco-orange-2" . "#9B5C2E")
    ("choco-orange-3" . "#6D4C2F")
    ("choco-yellow+3" . "#DDF2A4")
    ("choco-yellow+2" . "#DAEFA3")
    ("choco-yellow+1" . "#F9EE98")
    ("choco-yellow"   . "#F1E694")
    ("choco-yellow-1" . "#D3CBA1")
    ("choco-yellow-2" . "#C3BE98")
    ("choco-green+3"  . "#999D63")
    ("choco-green+2"  . "#8F9D6A")
    ("choco-green+1"  . "#79A660")
    ("choco-green"    . "#7CA563")
    ("choco-green-1"  . "#679D47")
    ("choco-green-2"  . "#253B22")
    ("choco-blue+5"   . "#DDF0FF")
    ("choco-blue+4"   . "#AFC4DB")
    ("choco-blue+3"   . "#8996A8")
    ("choco-blue+2"   . "#8693A5")
    ("choco-blue+1"   . "#7690A4")
    ("choco-blue"     . "#7989A6")
    ("choco-blue-1"   . "#5E828D")
    ("choco-purple"   . "#A8799C")
    ("choco-purple-1" . "#562D56")
    ("choco-purple-2" . "#420E09"))
  "List of Choco colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro choco-with-color-variables (&rest body)
  "`let' bind all colors defined in `choco-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append choco-default-colors-alist
                           choco-override-colors-alist)))
     ,@body))

;;; Theme Faces
(choco-with-color-variables
  (custom-theme-set-faces
   'choco
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,choco-blue :underline t :weight bold))))
   `(link-visited ((t (:foreground ,choco-blue-1 :underline t :weight normal))))
   `(default ((t (:foreground ,choco-fg :background ,choco-bg))))
   `(cursor ((t (:background ,choco-bg+5))))
   `(escape-glyph ((t (:foreground ,choco-fg-7 :weight bold))))
   `(fringe ((t (:foreground ,choco-fg :background ,choco-bg+1))))
   `(header-line ((t (:foreground ,choco-fg+2
                                  :background ,choco-bg+1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,choco-bg+6))))
   `(success ((t (:foreground ,choco-green :weight bold))))
   `(warning ((t (:foreground ,choco-orange :weight bold))))
   `(tooltip ((t (:foreground ,choco-fg :background ,choco-bg+1))))
;;;;; ag
   `(ag-match-face ((t (:background ,choco-bg+1, :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,choco-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,choco-green))))
   `(compilation-error-face ((t (:foreground ,choco-red :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,choco-fg))))
   `(compilation-info-face ((t (:foreground ,choco-blue))))
   `(compilation-info ((t (:foreground ,choco-blue :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,choco-green))))
   `(compilation-line-face ((t (:foreground ,choco-yellow))))
   `(compilation-line-number ((t (:foreground ,choco-red))))
   `(compilation-message-face ((t (:foreground ,choco-blue))))
   `(compilation-warning-face ((t (:foreground ,choco-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,choco-green :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,choco-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,choco-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,choco-fg-1))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,choco-fg))))
   `(grep-error-face ((t (:foreground ,choco-red :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,choco-blue))))
   `(grep-match-face ((t (:foreground ,choco-orange :weight bold))))
   `(match ((t (:background ,choco-bg+5 :foreground ,choco-orange :weight bold))))
;;;;; hi-lock
   `(hi-blue    ((t (:background ,choco-blue    :foreground ,choco-bg+1))))
   `(hi-green   ((t (:background ,choco-green   :foreground ,choco-bg+1))))
   `(hi-pink    ((t (:background ,choco-red+2   :foreground ,choco-bg+1))))
   `(hi-yellow  ((t (:background ,choco-yellow  :foreground ,choco-bg+1))))
   `(hi-blue-b  ((t (:foreground ,choco-blue+1    :weight     bold))))
   `(hi-green-b ((t (:foreground ,choco-green+1 :weight     bold))))
   `(hi-red-b   ((t (:foreground ,choco-red     :weight     bold))))
;;;;; info
   `(Info-quoted ((t (:inherit font-lock-constant-face))))
;;;;; isearch
   `(isearch ((t (:foreground ,choco-fg+2 :weight bold :background ,choco-bg+3))))
   `(isearch-fail ((t (:foreground ,choco-fg :background ,choco-red-2))))
   `(lazy-highlight ((t (:foreground ,choco-fg+2 :weight bold :background ,choco-bg+1))))

   `(menu ((t (:foreground ,choco-fg :background ,choco-bg))))
   `(minibuffer-prompt ((t (:foreground ,choco-yellow))))
   `(mode-line
     ((,class (:foreground ,choco-fg
                           :background ,choco-bg+6
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,choco-fg :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,choco-fg
                      :background ,choco-bg
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,choco-blue+5))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,choco-bg+1))))
   `(trailing-whitespace ((t (:background ,choco-orange))))
   `(vertical-border ((t (:foreground ,choco-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,choco-yellow :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,choco-green-1 :background ,choco-bg+1))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,choco-green-1))))
   `(font-lock-constant-face ((t (:foreground ,choco-red))))
   `(font-lock-doc-face ((t (:foreground ,choco-yellow+3))))
   `(font-lock-function-name-face ((t (:foreground ,choco-orange-3))))
   `(font-lock-keyword-face ((t (:foreground ,choco-fg-7 :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,choco-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,choco-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,choco-yellow+3 :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,choco-yellow+3 :weight bold))))
   `(font-lock-string-face ((t (:foreground ,choco-green))))
   `(font-lock-type-face ((t (:foreground ,choco-purple))))
   `(font-lock-variable-name-face ((t (:foreground ,choco-blue))))
   `(font-lock-warning-face ((t (:foreground ,choco-orange :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; man
   '(Man-overstrike ((t (:inherit font-lock-keyword-face))))
   '(Man-underline  ((t (:inherit (font-lock-string-face underline)))))
;;;;; woman
   '(woman-bold   ((t (:inherit font-lock-keyword-face))))
   '(woman-italic ((t (:inherit (font-lock-string-face italic)))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,choco-fg-1 :background ,choco-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,choco-green+1 :background ,choco-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,choco-fg-1 :background ,choco-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,choco-fg-1 :background ,choco-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,choco-green :background ,choco-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-1
     ((t (:foreground ,choco-yellow :background ,choco-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-2
     ((t (:foreground ,choco-red :background ,choco-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,choco-blue :background ,choco-bg :inverse-video nil :weight bold))))
;;;;; cider
   `(cider-result-overlay-face ((t (:background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,choco-orange :line-width -1)))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,choco-green+1))))
   `(cider-deprecated-face ((t (:background ,choco-yellow-2))))
   `(cider-instrumented-face ((t (:box (:color ,choco-red :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,choco-blue :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,choco-red-2))))
   `(cider-test-error-face ((t (:background ,choco-red))))
   `(cider-test-success-face ((t (:background ,choco-green-1))))
   `(cider-fringe-good-face ((t (:foreground ,choco-green+3))))
;;;;; diff
   `(diff-added          ((t (:background ,choco-green-2 :foreground ,choco-fg+2))))
   `(diff-changed        ((t (:background ,choco-bg+3 :foreground ,choco-fg+2))))
   `(diff-removed        ((t (:background ,choco-purple-2 :foreground ,choco-fg+2))))
   `(diff-refine-added   ((t (:background ,choco-green-2 :foreground ,choco-fg+2))))
   `(diff-refine-change  ((t (:background ,choco-bg+3 :foreground ,choco-fg+2))))
   `(diff-refine-removed ((t (:background ,choco-purple-2 :foreground ,choco-fg+2))))
   `(diff-header ((,class (:background ,choco-bg+1))
                  (t (:background ,choco-bg+1 :foreground ,choco-fg+2))))
   `(diff-file-header
     ((,class (:background ,choco-bg+1 :foreground ,choco-fg+2 :weight bold))
      (t (:background ,choco-bg+1 :foreground ,choco-fg+2 :weight bold))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,choco-fg+2 :background ,choco-bg+3))))
   `(diff-hl-delete ((,class (:foreground ,choco-fg+2 :background ,choco-purple-2))))
   `(diff-hl-insert ((,class (:foreground ,choco-fg+2 :background ,choco-green-2))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,choco-fg :background ,choco-red-2))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,choco-fg :background ,choco-red-2))))
   `(ediff-current-diff-B ((t (:foreground ,choco-fg :background ,choco-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,choco-fg :background ,choco-blue-1))))
   `(ediff-even-diff-A ((t (:background ,choco-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,choco-bg+1))))
   `(ediff-even-diff-B ((t (:background ,choco-bg+1))))
   `(ediff-even-diff-C ((t (:background ,choco-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,choco-fg :background ,choco-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,choco-fg :background ,choco-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,choco-fg :background ,choco-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,choco-fg :background ,choco-blue-1 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,choco-bg+1))))
   `(ediff-odd-diff-Ancestor ((t (:background ,choco-bg+1))))
   `(ediff-odd-diff-B ((t (:background ,choco-bg+1))))
   `(ediff-odd-diff-C ((t (:background ,choco-bg+1))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,choco-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-red-1) :inherit unspecified))
      (t (:foreground ,choco-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-yellow) :inherit unspecified))
      (t (:foreground ,choco-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-blue+4) :inherit unspecified))
      (t (:foreground ,choco-blue+4 :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,choco-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,choco-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,choco-blue+4 :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,choco-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,choco-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,choco-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-orange) :inherit unspecified))
      (t (:foreground ,choco-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,choco-red) :inherit unspecified))
      (t (:foreground ,choco-red-1 :weight bold :underline t))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,choco-green+1 :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,choco-blue+1  :weight bold)))) ; obsolete
   `(git-commit-comment-branch-local  ((,class (:foreground ,choco-blue+1  :weight bold))))
   `(git-commit-comment-branch-remote ((,class (:foreground ,choco-green  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,choco-yellow  :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, choco-orange))))
;;;;; irfc
   `(irfc-head-name-face ((t (:foreground ,choco-red :weight bold))))
   `(irfc-head-number-face ((t (:foreground ,choco-red :weight bold))))
   `(irfc-reference-face ((t (:foreground ,choco-blue-1 :weight bold))))
   `(irfc-requirement-keyword-face ((t (:inherit font-lock-keyword-face))))
   `(irfc-rfc-link-face ((t (:inherit link))))
   `(irfc-rfc-number-face ((t (:foreground ,choco-blue+4 :weight bold))))
   `(irfc-std-number-face ((t (:foreground ,choco-green+3 :weight bold))))
   `(irfc-table-item-face ((t (:foreground ,choco-green+2))))
   `(irfc-title-face ((t (:foreground ,choco-yellow
                                      :underline t :weight bold))))
;;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,choco-green :background ,choco-bg))))
   `(ivy-current-match ((t (:foreground ,choco-yellow :weight bold :underline t))))
   `(ivy-cursor ((t (:foreground ,choco-bg :background ,choco-fg))))
   `(ivy-match-required-face ((t (:foreground ,choco-red :background ,choco-bg))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,choco-bg+1))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,choco-green-1))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,choco-green))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,choco-green+1))))
   `(ivy-remote ((t (:foreground ,choco-blue :background ,choco-bg))))
   `(ivy-subdir ((t (:foreground ,choco-yellow :background ,choco-bg))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,choco-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,choco-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,choco-yellow))))
   `(ido-indicator ((t (:foreground ,choco-yellow :background ,choco-red-2))))
;;;;; linum-mode
   `(linum ((t (:foreground ,choco-green+2 :background ,choco-bg))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,choco-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,choco-yellow))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,choco-yellow :box t))))
   `(ruler-mode-default ((t (:foreground ,choco-green+2 :background ,choco-bg))))
;;;;; magit
;;;;;; headings and diffs
   `(magit-section-highlight           ((t (:background ,choco-bg+4))))
   `(magit-section-heading             ((t (:foreground ,choco-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,choco-orange :weight bold))))

   `(magit-diff-added-highlight ((t (:background ,choco-green))))
   `(magit-diff-removed-highlight ((t (:background ,choco-red))))
   `(magit-diff-added ((t (:background ,choco-green-1))))
   `(magit-diff-removed ((t (:background ,choco-red-2))))

   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,choco-bg+4  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,choco-bg+4
                                                        :foreground ,choco-orange :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,choco-bg+1))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,choco-bg+1))))
   `(magit-diff-hunk-heading-selection ((t (:background ,choco-bg+1
                                                        :foreground ,choco-orange))))
   `(magit-diff-lines-heading          ((t (:background ,choco-orange
                                                        :foreground ,choco-bg+1))))
   `(magit-diff-context-highlight      ((t (:background ,choco-bg+6
                                                        :foreground ,choco-fg))))
   `(magit-diffstat-added   ((t (:foreground ,choco-green-1))))
   `(magit-diffstat-removed ((t (:foreground ,choco-red-2))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,choco-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,choco-green-1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,choco-green   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,choco-fg-1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,choco-blue-1  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,choco-green  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,choco-red    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,choco-orange))))
   `(magit-log-date      ((t (:foreground ,choco-fg-1))))
   `(magit-log-graph     ((t (:foreground ,choco-fg+1))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,choco-yellow-2))))
   `(magit-sequence-stop ((t (:foreground ,choco-green))))
   `(magit-sequence-part ((t (:foreground ,choco-yellow))))
   `(magit-sequence-head ((t (:foreground ,choco-blue))))
   `(magit-sequence-drop ((t (:foreground ,choco-red))))
   `(magit-sequence-done ((t (:foreground ,choco-fg-1))))
   `(magit-sequence-onto ((t (:foreground ,choco-fg-1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,choco-green))))
   `(magit-bisect-skip ((t (:foreground ,choco-yellow))))
   `(magit-bisect-bad  ((t (:foreground ,choco-red))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,choco-bg+1 :foreground ,choco-blue-1))))
   `(magit-blame-hash    ((t (:background ,choco-bg+1 :foreground ,choco-blue-1))))
   `(magit-blame-name    ((t (:background ,choco-bg+1 :foreground ,choco-orange))))
   `(magit-blame-date    ((t (:background ,choco-bg+1 :foreground ,choco-orange))))
   `(magit-blame-summary ((t (:background ,choco-bg+1 :foreground ,choco-blue-1
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,choco-bg+3))))
   `(magit-hash           ((t (:foreground ,choco-bg+3))))
   `(magit-tag            ((t (:foreground ,choco-orange :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,choco-green  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,choco-blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,choco-blue   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,choco-blue   :weight bold))))
   `(magit-refname        ((t (:background ,choco-bg+1 :foreground ,choco-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,choco-bg+1 :foreground ,choco-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,choco-bg+1 :foreground ,choco-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,choco-green))))
   `(magit-signature-bad       ((t (:foreground ,choco-red))))
   `(magit-signature-untrusted ((t (:foreground ,choco-yellow))))
   `(magit-signature-expired   ((t (:foreground ,choco-orange))))
   `(magit-signature-revoked   ((t (:foreground ,choco-purple))))
   '(magit-signature-error     ((t (:inherit    magit-signature-bad))))
   `(magit-cherry-unmatched    ((t (:foreground ,choco-blue+4))))
   `(magit-cherry-equivalent   ((t (:foreground ,choco-purple))))
   `(magit-reflog-commit       ((t (:foreground ,choco-green))))
   `(magit-reflog-amend        ((t (:foreground ,choco-purple))))
   `(magit-reflog-merge        ((t (:foreground ,choco-green))))
   `(magit-reflog-checkout     ((t (:foreground ,choco-blue+4))))
   `(magit-reflog-reset        ((t (:foreground ,choco-red))))
   `(magit-reflog-rebase       ((t (:foreground ,choco-purple))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,choco-green))))
   `(magit-reflog-remote       ((t (:foreground ,choco-blue+4))))
   `(magit-reflog-other        ((t (:foreground ,choco-blue+4))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,choco-green+1))))
   `(message-header-other ((t (:foreground ,choco-green))))
   `(message-header-to ((t (:foreground ,choco-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,choco-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,choco-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,choco-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,choco-green))))
   `(message-mml ((t (:foreground ,choco-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,choco-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,choco-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,choco-blue-1  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,choco-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,choco-blue-1  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,choco-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,choco-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,choco-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,choco-bg+3 :strike-through t))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,choco-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure ((t (:foreground ,choco-blue))))
   `(org-archived ((t (:foreground ,choco-fg :weight bold))))
   `(org-checkbox ((t (:background ,choco-bg+1 :foreground ,choco-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,choco-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,choco-red-1))))
   `(org-done ((t (:weight bold :weight bold :foreground ,choco-green+3))))
   `(org-formula ((t (:foreground ,choco-yellow-2))))
   `(org-headline-done ((t (:foreground ,choco-green+3))))
   `(org-hide ((t (:foreground ,choco-bg+1))))
   `(org-level-1 ((t (:foreground ,choco-orange))))
   `(org-level-2 ((t (:foreground ,choco-green+2))))
   `(org-level-3 ((t (:foreground ,choco-blue-1))))
   `(org-level-4 ((t (:foreground ,choco-yellow-2))))
   `(org-level-5 ((t (:foreground ,choco-blue+4))))
   `(org-level-6 ((t (:foreground ,choco-green-1))))
   `(org-level-7 ((t (:foreground ,choco-red-2))))
   `(org-level-8 ((t (:foreground ,choco-purple))))
   `(org-link ((t (:foreground ,choco-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,choco-green+3))))
   `(org-scheduled-previously ((t (:foreground ,choco-red))))
   `(org-scheduled-today ((t (:foreground ,choco-blue+1))))
   `(org-sexp-date ((t (:foreground ,choco-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,choco-green+2))))
   `(org-tag ((t (:weight bold :weight bold))))
   `(org-time-grid ((t (:foreground ,choco-orange))))
   `(org-todo ((t (:weight bold :foreground ,choco-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:weight bold :foreground ,choco-red :weight bold :underline nil))))
   `(org-column ((t (:background ,choco-bg+1))))
   `(org-column-title ((t (:background ,choco-bg+1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,choco-fg :background ,choco-bg+1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,choco-bg :background ,choco-red-1))))
   `(org-ellipsis ((t (:foreground ,choco-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,choco-blue+4 :underline t))))
   `(org-document-title ((t (:foreground ,choco-blue))))
   `(org-document-info ((t (:foreground ,choco-blue))))
   `(org-habit-ready-face ((t :background ,choco-green)))
   `(org-habit-alert-face ((t :background ,choco-yellow-1 :foreground ,choco-bg)))
   `(org-habit-clear-face ((t :background ,choco-blue-1)))
   `(org-habit-overdue-face ((t :background ,choco-red-2)))
   `(org-habit-clear-future-face ((t :background ,choco-blue-1)))
   `(org-habit-ready-future-face ((t :background ,choco-green-1)))
   `(org-habit-alert-future-face ((t :background ,choco-yellow-2 :foreground ,choco-bg)))
   `(org-habit-overdue-future-face ((t :background ,choco-red-2)))
;;;;; outline
   `(outline-1 ((t (:foreground ,choco-orange))))
   `(outline-2 ((t (:foreground ,choco-green+2))))
   `(outline-3 ((t (:foreground ,choco-blue-1))))
   `(outline-4 ((t (:foreground ,choco-yellow-2))))
   `(outline-5 ((t (:foreground ,choco-blue+4))))
   `(outline-6 ((t (:foreground ,choco-green-1))))
   `(outline-7 ((t (:foreground ,choco-red-2))))
   `(outline-8 ((t (:foreground ,choco-purple))))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,choco-yellow-2 :inherit mode-line))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,choco-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,choco-green+3))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,choco-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,choco-blue+4))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,choco-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,choco-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,choco-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,choco-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,choco-blue-1))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,choco-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,choco-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,choco-purple))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,choco-yellow :weight bold))))
   `(sh-quoted-exec ((t (:foreground ,choco-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,choco-red+1 :background ,choco-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,choco-bg+3 :weight bold))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,choco-red+1 :background ,choco-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,choco-bg+3 :weight bold))))
;;;;; term
   `(term-color-black ((t (:foreground ,choco-bg
                                       :background ,choco-bg+1))))
   `(term-color-red ((t (:foreground ,choco-red
                                     :background ,choco-red-2))))
   `(term-color-green ((t (:foreground ,choco-green
                                       :background ,choco-green+2))))
   `(term-color-yellow ((t (:foreground ,choco-yellow
                                        :background ,choco-orange))))
   `(term-color-blue ((t (:foreground ,choco-blue
                                      :background ,choco-blue-1))))
   `(term-color-magenta ((t (:foreground ,choco-purple
                                         :background ,choco-red+2))))
   `(term-color-cyan ((t (:foreground ,choco-blue+4
                                      :background ,choco-blue))))
   `(term-color-white ((t (:foreground ,choco-fg
                                       :background ,choco-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,choco-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,choco-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,choco-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,choco-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,choco-blue+4))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,choco-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,choco-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,choco-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,choco-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,choco-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,choco-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,choco-blue+4))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,choco-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,choco-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,choco-purple-2))))
   `(whitespace-hspace ((t (:background ,choco-purple-2))))
   `(whitespace-tab ((t (:background ,choco-purple-2))))
   `(whitespace-newline ((t (:background ,choco-purple-2))))
   `(whitespace-trailing ((t (:background ,choco-purple-2))))
   `(whitespace-line ((t (:background ,choco-purple-2))))
   `(whitespace-space-before-tab ((t (:background ,choco-purple-2))))
   `(whitespace-indentation ((t (:background ,choco-purple-2))))
   `(whitespace-empty ((t (:background ,choco-purple-2))))
   `(whitespace-space-after-tab ((t (:background ,choco-purple-2))))))

;; Theme Variables
(choco-with-color-variables
  (custom-theme-set-variables
   'choco
;;;;; ansi-color
   `(ansi-color-names-vector [,choco-bg ,choco-red ,choco-green ,choco-yellow
                                        ,choco-blue ,choco-purple ,choco-blue-1 ,choco-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,choco-bg+1)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,choco-red ,choco-orange-3 ,choco-red+2 ,choco-orange ,choco-green
                  ,choco-blue ,choco-blue+1 ,choco-purple))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,choco-red-1)
       ( 40. . ,choco-red)
       ( 60. . ,choco-orange-2)
       ( 80. . ,choco-orange)
       (100. . ,choco-orange+1)
       (120. . ,choco-yellow)
       (140. . ,choco-yellow+3)
       (160. . ,choco-green-1)
       (180. . ,choco-green)
       (200. . ,choco-green+1)
       (220. . ,choco-green+2)
       (240. . ,choco-green+3)
       (260. . ,choco-blue-1)
       (280. . ,choco-blue)
       (300. . ,choco-blue+1)
       (320. . ,choco-blue+2)
       (340. . ,choco-blue+3)
       (360. . ,choco-purple)))
   `(vc-annotate-very-old-color ,choco-purple)
   `(vc-annotate-background ,choco-bg+1)))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar choco-add-font-lock-keywords nil
  "Whether to add font-lock keywords for choco color names.
In buffers visiting library `choco-theme.el' the choco specific
keywords are always added.  In all other Emacs-Lisp buffers this
variable controls whether this should be done.  This requires
library `rainbow-mode'.")

(defvar choco-colors-font-lock-keywords nil)

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'choco)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; choco-theme.el ends here
