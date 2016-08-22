;;  Jia Zhang's Emacs Configuration
;;					
;;org-mode control
(setq org-todo-keywords
      '((sequence "TODO(t!)" "WORKING(w!)" "HANGUP(h!)" "SOMEDAY(s)" "|" "DONE(d!)" "CANCEL(c!)")
             ))    
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;Package Control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;;Python Support
(add-to-list 'package-archives
			              '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)

(elpy-enable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;set y to yes
(defalias 'yes-or-no-p 'y-or-n-p)

;;;;;;;
                                        ;outline tree of file

;;;paran match
(show-paren-mode 1)

;;color theme
(load-theme 'wombat t)
;;show line num
(global-linum-mode t)
(column-number-mode t)

;;parenthensis pairing
(electric-pair-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dealing with indent width
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default c-basic-offset 4
              c-default-style "linux")

;;use space instead of tabs, use nil
(setq-default indent-tabs-mode t)

(setq default-tab-width 4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;
;;;;;;;        Define helm bahavior here 

;;reference :        http://tuhdo.github.io/c-ide.html
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;
(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-helm)
(require 'setup-helm-gtags)

;;;;;;;; Enable speedbar
(setq speedbar-show-unknown-files t)

;;;;;;;;;;
;;;;; semantic completion part
;;;;;;;
(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
;
(semantic-mode 1)

;;;;;;;;outline tree
;(require 'function-args)
;(fa-config-default)
;(define-key c-mode-map  [(control tab)] 'moo-complete)
;(define-key c++-mode-map  [(control tab)] 'moo-complete)
;(define-key c-mode-map (kbd "M-o")  'fa-show)
;(define-key c++-mode-map (kbd "M-o")  'fa-show);


;;;;;; Completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(semantic-add-system-include "/usr/include/linux")
(semantic-add-system-include "/usr/include/sys")
(semantic-add-system-include "/usr/include/netinet")
                                        ;
(define-key c-mode-map  [(tab)] 'company-gtags)
(define-key c++-mode-map  [(tab)] 'company-gtags)
(add-to-list 'company-backends 'company-semantic)
;;
(add-to-list 'company-backends 'company-c-headers)


(global-semantic-idle-summary-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(global-semantic-stickyfunc-mode 1)
;;;;;;;;;;;;;;;;;;;;;;set up folding
;(add-hook 'c-mode-common-hook   'hs-minor-mode)

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
        scroll-preserve-screen-position 1)
;;define gtags completion
(define-key c-mode-map  [(backtab)] 'company-gtags)
(define-key c++-mode-map  [(backtab)] 'company-gtags)

;; care about auctex mode
;(load "auctex.el" nil t t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

