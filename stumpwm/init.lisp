;; -*- mode: lisp; mode: stumpwm -*-

(in-package :stumpwm)

(run-shell-command "sh ~/.xprofile")

(run-shell-command "flameshot &")
(run-shell-command "nextcloud &")
(run-shell-command "kdeconnect-indicator &")
(run-shell-command "nm-applet &")
(run-shell-command "blueman-applet &")

(mode-line)
(setf stumpwm:*window-format* "%m%n%s%c")
(setf stumpwm:*screen-mode-line-format*
	(list "[%B] -- [ %D] -- %w -- "
	      '(:eval (stumpwm:run-shell-command "date" t))))

(set-prefix-key (kbd "F20"))

(defvar *my-media-keymap*
  (let ((m (make-sparse-keymap)))
    (define-key *top-map* (kbd "XF86AudioRaiseVolume")
      "exec amixer -q sset Master 10%+")
    (define-key *top-map* (kbd "XF86AudioLowerVolume")
      "exec amixer -q sset Master 10%-")
    (define-key *top-map* (kbd "XF86AudioMute")
      "exec amixer -q sset Master 1+ toggle")
    (define-key *top-map* (kbd "XF86AudioMicMute")
      "exec amixer -q sset Capture 1+ toggle")
    (define-key *top-map* (kbd "XF86MonBrightnessUp")
      "exec light -A 10")
    (define-key *top-map* (kbd "XF86MonBrightnessDown")
      "exec light -U 10")))

(defcommand suspend () ()
  (run-shell-command "systemctl suspend"))

(defcommand hibernate () ()
  (run-shell-command "systemctl hibernate"))

(load-module "stumptray")
(stumptray::stumptray)

(load-module "battery-portable")

;; (load-module "maildir")
;; (push (cons "Job" (realname "~/Mail/Inbox/")) maildir:*maildir-alist*)

(load-module "ttf-fonts")
(xft:cache-fonts)
(set-font (make-instance 'xft:font
			  :family "Noto Sans Mono"
			  :subfamily "Regular"
			  :size 11
			  :antialias t))

(load-module "disk")
(setf disk:*disk-modeline-fmt* "%a")

(load-module "swm-gaps")
(setf swm-gaps:*head-gaps-size* 0)
(setf swm-gaps:*outer-gaps-size* 20)
(setf swm-gaps:*inner-gaps-size* 5)
