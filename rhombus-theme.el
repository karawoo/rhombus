;;; rhombus-theme.el --- A black theme for Emacs 24

;; Copyright (C) 2015 Ross Donaldson

;; Author: Ross Donaldson <gastove@gmail.com>
;; URL: https://github.com/Gastove/rhombus
;; Version 1.0.0

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

;;; Credits:

;; This theme inspired by (and based heavily on) badger-theme.el by Cody
;; Canning, and flatland-back-theme, (which was auto-generated by, as best as I
;; can tell, Jason Milkins). The structure of this theme was based on
;; zenburn-theme.el by Bozhidar Batsov

;;; Code:
(deftheme rhombus "The Rhombus color theme")

;; Rhombus Color Palette
(defvar rhombus-colors-alit
  '(("rhombus-fg"             . "#F8F8F8")
    ("rhombus-fg+1"           . "#FBF9F3")
    ("rhombus-bg"             . "#000000")
    ("rhombus-bg+1"           . "#171717")

;; The Main Pallette
    ("rhombus-red"            . "#9e1200")
    ("rhombus-orange"         . "#fa9a4b")
    ("rhombus-orange-1"       . "#D84c00")
    ("rhombus-yellow"         . "#D6d300")
    ("rhombus-olive"          . "#24992c")
    ("rhomus-violet"          . "#A630db")
    ("rhombus-grey"           . "#Bbbbbb")
    ("rhombus-dark-brown"     . "#9d5717")
    ("rhombus-light-brown"    . "#F7b372")

;; Backup-dancing colors
    ("rhombus-blue"           . "#1789d6")
;; Other People's Good Ideas
    ("rhombus-link")
    ("rhombus-warn"           . "#9e3564")
    ("rhombus-succ"           . "#809a4d")
    ("rhombus-hl")
    ))

;; This is seriously cool. H/T to whoever came up with it! Helpful hint: it was
;; not me. I got it from badger-theme.el
(defmacro rhombus/with-color-variables (&rest body)
  "`let' bind all colors defined in `badger-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   rhombus-colors-alist))
     ,@body))

(rhombus/with-color-variables
  (custom-theme-set-faces
   'rhombus

   ;; >>>>> Built-in
   '(button ((t (:underline t))))
   `(link ((t (:bold t :foreground ,rhombus-blue :underline t :weight bold))))
   ;; `(link-visited ((t (:foreground ,rhombus-salmon-2 :underline t :weight normal))))

   ;; ordinary text. Its background color is used as the frame's background color.
   `(default ((t (:foreground ,rhombus-fg :background ,rhombus-bg))))

   ;;The :background attribute of this face specifies the color of the text cursor
   `(cursor ((t (:background ,rhombus-grey))))

   ;; The face for displaying control characters and escape sequences
   `(escape-glyph ((t (:foreground ,rhombus-grey :bold t))))

   ;; The face for the narrow fringes to the left and right of windows on graphic displays.
   `(fringe ((t (:foreground ,rhombus-fg :background ,rhombus-bg+1))))

   ;; hru? -- RMD
   ;; fixed line displayed at the top of the emacs window, not in XEmacs
   ;; `(header-line ((t (:foreground ,rhombus-salmon
   ;;                                :background ,"black"
   ;;                                :box (:line-width -1 :style released-button)))))

   ;;text highlighting in various contexts, when the mouse cursor is moved over a hyperlink.
   `(highlight ((t (:background ,rhombus-hl))))

   ;; “lazy matches” for Isearch and Query Replace (matches other than the current one).
   `(lazy-highlight ((t (:background ,rhombus-yellow :foreground ,"black" :weight extra-bold))))

   ;; This face is used to highlight the current Isearch match
   `(isearch ((t (:background ,rhombus-succ :foreground ,"black" :weight extra-bold))))


   `(success ((t (:foreground ,rhombus-succ :weight bold))))
   `(warning ((t (:foreground ,rhombus-warn :weight bold))))

   ;; This face is used for displaying an active region
   `(region ((t (:background ,"black"))))

   `(show-paren-match-face ((t (:background ,rhombus-lime :foreground ,"black" ))))

   ;; >>>>> mode-line
   `(mode-line    ((,class (:foreground ,rhombus-charcoal
                                        :background ,"black"
                                       ;; :box (:line-width -1 :style released-button)
                                        ))
                   (t :inverse-video nil)))

   `(mode-line-inactive ((t (:background ,rhombus-bg+1 :foreground ,"black" :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,rhombus-salmon))))
   `(minibuffer-prompt ((t (:foreground ,rhombus-violet))))

   ;;   `(mode-line-highlight ((t (:foreground ,rhombus-lime))))

   ;; linum
   `(linum ((t (:foreground ,rhombus-charcoal :background ,"black"))))


   ;; >>>>> font-lock
   `(font-lock-warning-face ((t (:foreground ,rhombus-yellow :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,rhombus-orange ))))
   `(font-lock-variable-name-face ((t (:foreground ,rhombus-salmon))))
   `(font-lock-keyword-face ((t (:foreground ,rhombus-blue))))
   `(font-lock-comment-face ((t (:foreground ,rhombus-charcoal))))
   ;;`(font-lock-comment-delimiter-face ((t (:foreground ,rhombus-charcoal :weight light :slant italic))))
   `(font-lock-type-face ((t (:foreground ,rhombus-sand))))
   `(font-lock-constant-face ((t (:foreground ,rhombus-dark-violet))))
   `(font-lock-builtin-face ((t (:foreground ,rhombus-violet))))
   `(font-lock-preprocessor-face ((t (:foreground ,rhombus-sand))))
   `(font-lock-string-face ((t (:foreground ,rhombus-green))))
 ;;  `(font-lock-doc-face ((t (:foreground ,rhombus-green))))


   ;; >>>>> eshell
   `(eshell-prompt ((t (:foreground ,rhombus-lime))))
   `(eshell-ls-archive ((t (:foreground ,rhombus-orange :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,rhombus-violet :weight normal))))
   `(eshell-ls-executable ((t (:foreground ,rhombus-yellow :weight normal))))
   `(eshell-ls-unreadable ((t (:foreground ,rhombus-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,rhombus-blue :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,rhombus-link :weight bold))))

   ;; >>>>> Org mode
   `(org-document-info-keyword ((t (:foreground ,rhombus-olive))))
   `(org-document-title ((t (:foreground ,rhombus-salmon :height 1.50))))
   `(org-archived ((t (:foreground ,rhombus-fg :weight bold))))
   `(org-checkbox ((t (:foreground ,rhombus-fg+1 :foreground ,rhombus-olive
                                   :box (:line-width 1 :style released-button)))))
   `(org-done ((t (:foreground ,rhombus-lime :strike-through t))))
   `(org-todo ((t (:foreground ,rhombus-red))))
   `(org-formula ((t (:foreground ,rhombus-violet))))
   `(org-headline-done ((t (:strike-through t :foreground ,rhombus-charcoal))))
   `(org-hide ((t (:foreground ,rhombus-bg))))
   `(org-level-1 ((t (:foreground ,rhombus-blue))))
   `(org-level-2 ((t (:foreground ,rhombus-violet))))
   `(org-level-3 ((t (:foreground ,rhombus-orange))))
   `(org-level-4 ((t (:foreground ,rhombus-yellow))))
   `(org-level-5 ((t (:foreground ,rhombus-salmon))))
   `(org-level-6 ((t (:foreground ,rhombus-green))))
   `(org-level-7 ((t (:foreground ,rhombus-brown))))
   `(org-level-8 ((t (:foreground ,rhombus-teal))))
   `(org-link ((t (:foreground ,rhombus-link :underline t))))

   `(org-agenda-date ((t (:foreground ,rhombus-blue))))
   `(org-deadline-announce ((t (:foreground ,rhombus-dull-red))))
   `(org-date ((t (:foreground ,rhombus-link :underline t))))
   `(org-agenda-date-today  ((t (:foreground ,rhombus-salmon :weight light :slant italic))))
   `(org-agenda-structure  ((t (:inherit font-lock-comment-face))))
   ;; `(org-scheduled ((t (:foreground ,zenburn-green+4))))x
   ;; `(org-scheduled-previously ((t (:foreground ,zenburn-red-4))))
   ;; `(org-scheduled-today ((t (:foreground ,zenburn-blue+1))))
   ;; `(org-sexp-date ((t (:foreground ,zenburn-blue+1 :underline t))))
   ;; `(org-time-grid ((t (:foreground ,zenburn-orange))))
   ;; `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))

   `(org-special-keyword ((t (:foreground ,rhombus-olive :weight normal))))
   `(org-table ((t (:foreground ,rhombus-olive))))
   `(org-tag ((t (:bold t :foreground ,rhombus-orange :strike-through nil))))
   `(org-warning ((t (:bold t :foreground ,rhombus-pink :weight bold))))
   `(org-column ((t (:background ,"black"))))
   `(org-column-title ((t (:background ,"black" :foreground ,rhombus-lime :underline t))))
   `(org-mode-line-clock ((t (:foreground ,rhombus-yellow))))
   `(org-footnote ((t (:foreground ,rhombus-link :underline t))))
   `(org-code ((t (:foreground ,rhombus-olive))))
   `(org-verbatim ((t (:inherit org-code))))

   ;; >>>>> elpy and ipython
   `(highlight-indentation-face ((t (:background ,rhombus-bg))))
   `(comint-highlight-prompt ((t (:inherit eshell-prompt))))

   ;; >>>>> auto-complete and popup
   `(ac-candidate-face ((t (:background ,rhombus-sand :foreground ,"black"))))
   `(ac-selection-face ((t (:background ,rhombus-violet :foreground ,"black"))))
   `(popup-tip-face ((t (:background ,rhombus-sand :foreground ,"black"))))
   `(popup-scroll-bar-foreground-face ((t (:background ,rhombus-dark-violet))))
   `(popup-scroll-bar-background-face ((t (:background ,rhombus-olive))))
   `(popup-isearch-match ((t (:background ,rhombus-yellow :foreground ,"black"))))

   ;; I'm 98% sure I don't use smart-mode-line
   ;; >>>>> smart-mode-line
   ;; `(sml/global ((t (:background ,"black" :inverse-video nil))))
   ;; `(sml/folder ((t (:foreground ,rhombus-charcoal))))
   ;; `(sml/filename ((t (:foreground ,rhombus-salmon :weight normal))))
   ;; `(sml/prefix   ((t (:foreground ,rhombus-salmon :weight normal))))
   ;; `(sml/line-number ((t (:foreground ,rhombus-blue :weight normal))))
   ;; `(sml/col-number ((t (:foreground ,rhombus-green :weight normal))))
   ;; `(sml/read-only ((t (:foreground ,rhombus-charcoal))))
   ;; `(sml/outside-modified ((t (:foreground ,rhombus-red))))
   ;; `(sml/modified ((t (:foreground ,rhombus-red))))
   ;; `(sml/remote ((t (:foreground ,rhombus-charcoal))))
   ;; `(sml/numbers-separator ((t (:foreground ,rhombus-charcoal))))
   ;; `(sml/client ((t (:foreground ,rhombus-succ))))
   ;; `(sml/not-modified ((t (:foreground ,rhombus-yellow))))
   ;; `(sml/git  ((t (:foreground ,rhombus-blue))))
   ;; `(sml/vc-edited  ((t (:foreground ,rhombus-blue))))
   ;; `(sml/modes ((t (:foreground ,rhombus-pink))))
   ;; `(sml/position-percentage ((t (:foreground ,rhombus-charcoal))))

   `(flyspell-incorrect ((t (:underline (:color ,rhombus-red :style wave)))))
   `(flyspell-duplicate ((t (:underline (:color ,rhombus-yellow :style wave)))))

   ;; >>>>> Company Mode
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))

   ;; >>>>> Helm
   ;; `(helm-bookmark-info)
   ;; `(helm-helper)
   ;; `(helm-bookmark-w3m)
   ;; `(helm-apt-installed)
   ;; `(helm-apt-deinstalled)
   ;; `(helm-time-zone-current)
   ;; `(helm-time-zone-home)
   ;; `(helm-buffer-saved-out)
   ;; `(helm-buffer-not-saved)
   ;; `(helm-grep-match)
   ;; `(helm-grep-file)
   ;; `(helm-top-columns)
   ;; `(helm-M-x-key)
   ;; `(helm-locate-finish)
   ;; `(helm-etags-file)
   ;; `(helm-lisp-show-completion)
   ;; `(helm-lisp-completion-info)
   ;; `(helm-source-header)
   ;; `(helm-visible-mark)
   ;; `(helm-match-item)
   ;; `(helm-selection-line)
   ;; `(helm-ff-prefix)
   ;; `(helm-ff-executable)
   ;; `(helm-moccur-buffer)
   ;; `(helm-resume-need-update)
   `(helm-ff-directory ((t (:background rhombus-bg+1 :foreground rhombus-red))))
   `(helm-selection ((t (:background rhombus-hl))))
   `(helm-source-header ((t (:background rhombus-dark-brown :foreground rhombus-fg :weight bold :height 1.3 :family "Sans Serif"))))
   ))
;;; rhombus-theme.el ends here
