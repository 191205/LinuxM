;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;; (package! exwm-x)
(package! exwm)
(package! helm-system-packages)
(package! xelb)

(package! exwm-nw :recipe (:fetcher github :repo "pjones/exwm-nw"))
(package! exwm-edit :recipe (:fetcher github :repo "agzam/exwm-edit"))
(package! symon :recipe (:fetcher github :repo "zk-phi/symon"))
(package! awesome-tray :recipe (:fetcher github :repo "manateelazycat/awesome-tray"))
;; config https://www.reddit.com/r/unixporn/comments/9zuhxm/exwm_solarized_os/eaho4b7/
(package! desktop-environment :recipe (:fetcher github :repo "DamienCassou/desktop-environment"))
;; (package! builtin-package :disable t)
