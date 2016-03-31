import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Layout
import XMonad.Layout.LimitWindows
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Named
import XMonad.Layout.Tabbed
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import System.IO
import Graphics.X11.ExtraTypes.XF86

myWorkspaces = ["1: web", "2: pdf", "3: chat", "4: code", "5: media", "6: term", "7: matlab"]
  ++ map show [8..9]

myManageHook = composeAll
  [ className =? "Firefox"                      --> doShift "1: web"
  , className =? "evince"                       --> doShift "2: pdf"
  , className =? "vlc"                          --> doShift "5: media"
  , isFullscreen                                --> doFullFloat
  ]
myLayout = Tall  1 (3/100) (1/2) ||| (Mirror $ Tall 1 (3/100) (1/2)) ||| Full
  --where
    --tall = named "Tall" $ limitWindows 4 $ minimize $ Tall 1 (3/100) (1/2)
    --tab = named "Tab" simpleTabbedBottom
    --float = named "Float" simpleFloat

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/manuel/.xmobarrc"
  xmonad $ withUrgencyHook NoUrgencyHook def
    { manageHook = myManageHook  <+> manageDocks <+> manageHook def,
      startupHook = setWMName "LG3D",
      handleEventHook = handleEventHook def <+> fullscreenEventHook,
      layoutHook = smartBorders . avoidStruts $  myLayout,
      terminal = "urxvt",
      workspaces = myWorkspaces,
      focusedBorderColor = "#dc322f",
      normalBorderColor = "#586e75",
      logHook = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc,
          ppCurrent = xmobarColor "#859900" "" . wrap "[" "]",
          ppUrgent = xmobarColor "#dc322f" "",
          ppTitle = xmobarColor "#2aa198" "" . shorten 50
        }
    }  `additionalKeys`
    [ ((mod1Mask .|. controlMask, xK_l), spawn "xscreensaver-command --lock")
    , ((mod1Mask, xK_p), spawn "dmenu_run -nb \"#073642\" -nf \"#839496\" -sb \"#586e75\" -sf \"#fdf6e3\" -fn \"xft:Source Code Pro:size=10\"")
    , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
    ]


