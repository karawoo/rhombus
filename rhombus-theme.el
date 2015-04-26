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

(require 'color)

;; Rhombus Color Palette
(defvar rhombus-colors-alist
  '(("rhombus-fg"             . "#F8F8F8")
    ("rhombus-fg+1"           . "#FBF9F3")
    ("rhombus-bg"             . "#000000")
    ("rhombus-bg+1"           . "#171717")

    ;; The Main Pallette
    ("rhombus-red"            . "#9e1200")
    ("rhombus-dull-red"       . "#9e4d4a")
    ("rhombus-charcoal"       . "#656868")
    ("rhombus-orange"         . "#fa9a4b")
    ("rhombus-orange-1"       . "#D84c00")
    ("rhombus-orange+1"       . "#Ff5d00")
    ("rhombus-yellow"         . "#D6d300")
    ("rhombus-violet"         . "#A630db")
    ("rhombus-grey"           . "#Bbbbbb")
    ("rhombus-dark-brown"     . "#9d5717")
    ("rhombus-light-brown"    . "#F7b372")
    ("rhombus-sand"           . "#C7B299")
    ("rhombus-pink"           . "#D82e88")

    ;; Backup-dancing colors
    ("rhombus-olive"          . "#24992c")
    ("rhombus-green"          . "#24992c")
    ("rhombus-blue"           . "#1789d6")
    ("rhombus-light-blue"     . "#6cbbf1")
    ("rhombus-dark-violet"    . "#635770")
    ("rhombus-darker-violet"  . "#433F4F")
    ("rhombus-teal"           . "#65A399")


    ;; Other People's Good Ideas
    ("rhombus-link"           . "#8ACDAA")
    ("rhombus-warn"           . "#9e3564")
    ("rhombus-succ"           . "#809a4d")
    ("rhombus-hl"             . "#1D1D1D")))

;;(makunbound 'rhombus-colors-alist)

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
   ;; `(link-visited ((t (:foreground ,rhombus-grey-2 :underline t :weight normal))))

   ;; ordinary text. Its background color is used as the frame's background color.
   `(default ((t (:foreground ,rhombus-fg :background ,rhombus-bg))))

   ;;The :background attribute of this face specifies the color of the text cursor
   `(cursor ((t (:background ,rhombus-grey))))

   ;; The face for displaying control characters and escape sequences
   `(escape-glyph ((t (:foreground ,rhombus-grey :bold t))))

   ;; The face for the narrow fringes to the left and right of windows on graphic displays.
   `(fringe ((t (:foreground ,rhombus-fg :background ,rhombus-bg+1))))

   ;;text highlighting in various contexts, when the mouse cursor is moved over a hyperlink.
   `(highlight ((t (:background ,rhombus-hl))))

   ;; “lazy matches” for Isearch and Query Replace (matches other than the current one).
   `(lazy-highlight ((t (:background ,rhombus-olive :foreground ,"black" :weight extra-bold))))

   ;; This face is used to highlight the current Isearch match
   `(isearch ((t (:background ,rhombus-light-brown :foreground ,"black" :weight extra-bold))))

   `(success ((t (:foreground ,rhombus-succ :weight bold))))
   `(warning ((t (:foreground ,rhombus-warn :weight bold))))

   ;; This face is used for displaying an active region
   `(region ((t (:background ,rhombus-bg+1))))

   `(show-paren-match-face ((t (:background ,rhombus-olive :foreground ,"black" ))))

   ;; >>>>> mode-line
   `(mode-line    ((,class (:foreground ,rhombus-charcoal
                                        :background ,"black"
                                        ;; :box (:line-width -1 :style released-button)
                                        ))
                   (t :inverse-video nil)))

   `(mode-line-inactive ((t (:background ,rhombus-bg+1 :foreground ,"black" :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,rhombus-grey))))
   `(minibuffer-prompt ((t (:foreground ,rhombus-violet))))

   ;;`(mode-line-highlight ((t (:foreground ,rhombus-lime))))

   ;; linum
   `(linum ((t (:foreground ,rhombus-charcoal :background ,"black"))))


   ;; >>>>> font-lock
   `(font-lock-warning-face ((t (:foreground ,rhombus-warn :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,rhombus-orange-1))))
   `(font-lock-variable-name-face ((t (:foreground ,rhombus-grey))))
   `(font-lock-keyword-face ((t (:foreground ,rhombus-light-blue))))
   `(font-lock-comment-face ((t (:foreground ,rhombus-charcoal))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,rhombus-charcoal :weight light :slant italic))))
   `(font-lock-type-face ((t (:foreground ,rhombus-light-brown))))
   `(font-lock-constant-face ((t (:foreground ,rhombus-orange+1))))
   `(font-lock-builtin-face ((t (:foreground ,rhombus-dull-red))))
   `(font-lock-preprocessor-face ((t (:foreground ,rhombus-sand))))
   `(font-lock-string-face ((t (:foreground ,rhombus-fg+1))))
   `(font-lock-doc-face ((t (:foreground ,rhombus-grey))))


   ;; >>>>> eshell
   `(eshell-prompt ((t (:foreground ,rhombus-olive))))
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
   `(org-document-title ((t (:foreground ,rhombus-grey :height 1.50))))
   `(org-archived ((t (:foreground ,rhombus-fg :weight bold))))
   `(org-checkbox ((t (:foreground ,rhombus-fg+1 :foreground ,rhombus-olive
                                   :box (:line-width 1 :style released-button)))))
   `(org-done ((t (:foreground ,rhombus-olive :strike-through t))))
   `(org-todo ((t (:foreground ,rhombus-red))))
   `(org-formula ((t (:foreground ,rhombus-violet))))
   `(org-headline-done ((t (:strike-through t :foreground ,rhombus-charcoal))))
   `(org-hide ((t (:foreground ,rhombus-bg))))
   `(org-level-1 ((t (:foreground ,rhombus-blue))))
   `(org-level-2 ((t (:foreground ,rhombus-violet))))
   `(org-level-3 ((t (:foreground ,rhombus-orange))))
   `(org-level-4 ((t (:foreground ,rhombus-yellow))))
   `(org-level-5 ((t (:foreground ,rhombus-grey))))
   `(org-level-6 ((t (:foreground ,rhombus-green))))
   `(org-level-7 ((t (:foreground ,rhombus-dark-brown))))
   `(org-level-8 ((t (:foreground ,rhombus-teal))))
   `(org-link ((t (:foreground ,rhombus-link :underline t))))

   `(org-agenda-date ((t (:foreground ,rhombus-blue))))
   `(org-deadline-announce ((t (:foreground ,rhombus-dull-red))))
   `(org-date ((t (:foreground ,rhombus-link :underline t))))
   `(org-agenda-date-today  ((t (:foreground ,rhombus-grey :weight light :slant italic))))
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
   `(org-column-title ((t (:background ,"black" :foreground ,rhombus-olive :underline t))))
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

   ;; >>>>> smart-mode-line
   `(sml/global ((t (:background ,"black" :inverse-video nil))))
   `(sml/folder ((t (:foreground ,rhombus-charcoal))))
   `(sml/filename ((t (:foreground ,rhombus-grey :weight normal))))
   `(sml/prefix   ((t (:foreground ,rhombus-grey :weight normal))))
   `(sml/line-number ((t (:foreground ,rhombus-blue :weight normal))))
   `(sml/col-number ((t (:foreground ,rhombus-green :weight normal))))
   `(sml/read-only ((t (:foreground ,rhombus-charcoal))))
   `(sml/outside-modified ((t (:foreground ,rhombus-red))))
   `(sml/modified ((t (:foreground ,rhombus-red))))
   `(sml/remote ((t (:foreground ,rhombus-charcoal))))
   `(sml/numbers-separator ((t (:foreground ,rhombus-charcoal))))
   `(sml/client ((t (:foreground ,rhombus-succ))))
   `(sml/not-modified ((t (:foreground ,rhombus-yellow))))
   `(sml/git  ((t (:foreground ,rhombus-light-blue))))
   `(sml/vc-edited  ((t (:foreground ,rhombus-blue))))
   `(sml/modes ((t (:foreground ,rhombus-pink))))
   `(sml/position-percentage ((t (:foreground ,rhombus-charcoal))))

   `(flyspell-incorrect ((t (:underline (:color ,rhombus-red :style wave)))))
   `(flyspell-duplicate ((t (:underline (:color ,rhombus-yellow :style wave)))))

   ;; >>>>> Company Mode
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name rhombus-bg+1 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name rhombus-bg+1 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name rhombus-bg+1 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))

   ;; >>>>> Helm
   `(helm-header
     ((t (:foreground ,rhombus-dark-brown
                      :background ,rhombus-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:background ,rhombus-light-brown
                      :foreground ,rhombus-fg
                      :weight bold
                      :underline nil
                      :box (:line-width -1 :style released-button)
                      :height 1.3
                      :family "Sans Serif"))))
   `(helm-selection ((t (:background ,rhombus-hl :underline nil))))
   `(helm-selection-line ((t (:background ,rhombus-bg+1))))
   ;;   `(helm-visible-mark ((t (:foreground ,zenburn-bg :background ,zenburn-yellow-2))))
   ;;   `(helm-candidate-number ((t (:foreground ,zenburn-green+4 :background ,zenburn-bg-1))))
   ;;   `(helm-separator ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
   ;;   `(helm-time-zone-current ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
   ;;   `(helm-time-zone-home ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
   ;;   `(helm-bookmark-addressbook ((t (:foreground ,zenburn-orange :background ,zenburn-bg))))
   ;;   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   ;;   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   ;;   `(helm-bookmark-gnus ((t (:foreground ,zenburn-magenta :background ,zenburn-bg))))
   ;;   `(helm-bookmark-info ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
   ;;   `(helm-bookmark-man ((t (:foreground ,zenburn-yellow :background ,zenburn-bg))))
   ;;   `(helm-bookmark-w3m ((t (:foreground ,zenburn-magenta :background ,zenburn-bg))))
   ;;   `(helm-buffer-not-saved ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
   ;;   `(helm-buffer-process ((t (:foreground ,zenburn-cyan :background ,zenburn-bg))))
   ;;   `(helm-buffer-saved-out ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
   ;;   `(helm-buffer-size ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg))))
   `(helm-ff-directory ((t (:background ,rhombus-bg+1 :foreground ,rhombus-yellow))))
   `(helm-ff-file ((t (:foreground ,rhombus-fg :background ,rhombus-bg+1 :weight normal))))
   `(helm-ff-executable ((t (:foreground ,rhombus-violet :background ,rhombus-bg+1 :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,rhombus-warn :background ,rhombus-bg+1 :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,rhombus-light-blue :background ,rhombus-bg+1 :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,rhombus-bg :background ,rhombus-orange :weight normal))))
   ;;   `(helm-grep-cmd-line ((t (:foreground ,zenburn-cyan :background ,zenburn-bg))))
   ;;   `(helm-grep-file ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
   ;;   `(helm-grep-finish ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
   ;;   `(helm-grep-lineno ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg))))
   ;;   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   ;;   `(helm-grep-running ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
   ;;   `(helm-moccur-buffer ((t (:foreground ,zenburn-cyan :background ,zenburn-bg))))
   ;;   `(helm-mu-contacts-address-face ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg))))
   ;;   `(helm-mu-contacts-name-face ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))

   ;; >>>>> Magit, if I ever want to tweak it
   `(magit-item-highlight ((t (:background ,rhombus-bg+1))))
   `(magit-section-title ((t (:foreground ,rhombus-orange :weight bold))))
   `(magit-process-ok ((t (:foreground ,rhombus-succ :weight bold))))
   ;; `(magit-process-ng ((t (:foreground ,zenburn-red :weight bold))))
   `(magit-branch ((t (:foreground ,rhombus-light-blue :weight bold))))
   ;; `(magit-log-author ((t (:foreground ,zenburn-orange))))
   ;; `(magit-log-sha1 ((t (:foreground, zenburn-orange))))

   ;; >>>>> whitespace-mode
   ;; `(whitespace-space ((t (:background ,zenburn-bg+1 :foreground ,zenburn-bg+1))))
   ;; `(whitespace-hspace ((t (:background ,zenburn-bg+1 :foreground ,zenburn-bg+1))))
   ;; `(whitespace-tab ((t (:background ,zenburn-red-1))))
   ;; `(whitespace-newline ((t (:foreground ,zenburn-bg+1))))
   ;; `(whitespace-trailing ((t (:background ,zenburn-red))))
   ;; `(whitespace-line ((t (:background ,zenburn-bg :foreground ,zenburn-magenta))))
   ;; `(whitespace-space-before-tab ((t (:background ,zenburn-orange :foreground ,zenburn-orange))))
   ;; `(whitespace-indentation ((t (:background ,zenburn-yellow :foreground ,zenburn-red))))
   ;; `(whitespace-empty ((t (:background ,zenburn-yellow))))
   ;; `(whitespace-space-after-tab ((t (:background ,zenburn-yellow :foreground ,zenburn-red))))
   ))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'rhombus)

;;; rhombus-theme.el ends here
