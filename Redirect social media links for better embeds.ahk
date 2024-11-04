#Requires AutoHotkey v2.0

; Simple script to replace "https://twitter.com/..."and "https://x.com/..." links with their FxTwitter counterparts.
; Currently also supports multiple other social media sites. Those include Reddit, Instagram, Bluesky and TikTok.
; Could optionally be done with regex but simple comparisons is suffucient and less resource intensive.

OnClipboardChange ClipboardChanged

ClipboardChanged(clip_type) {
    if (clip_type == 1) {
        ; CF_UNICODETEXT == 13
        if DllCall("IsClipboardFormatAvailable", "Uint", 13) {
            temp_clipboard := A_Clipboard

            ; ------------ TWITTER ------------
            ; Replace Twitter links with FxTwitter (https://github.com/FixTweet/FxTwitter)
            temp_clipboard := StrReplace(temp_clipboard, "https://twitter.com/", "https://fxtwitter.com/")
            temp_clipboard := StrReplace(temp_clipboard, "https://x.com/", "https://fixupx.com/")
            ; Replace BetterTwitFix (https://github.com/dylanpdx/BetterTwitFix) links with FxTwitter
            ; (https://github.com/FixTweet/FxTwitter) for consistency in embeding provider since I preffer FxTwitter
            temp_clipboard := StrReplace(temp_clipboard, "https://vxtwitter.com/", "https://fxtwitter.com/")
            temp_clipboard := StrReplace(temp_clipboard, "https://fixvx.com/", "https://fixupx.com/")
            ; Alternative for those preffering BetterTwitFix
            ; Replace FxTwitter (https://github.com/FixTweet/FxTwitter) links with BetterTwitFix 
            ; (https://github.com/dylanpdx/BetterTwitFix) for consistency in embeding provider 
            ; temp_clipboard := StrReplace(temp_clipboard, "https://fxtwitter.com/", "https://vxtwitter.com/")
            ; temp_clipboard := StrReplace(temp_clipboard, "https://fixupx.com/", "https://fixvx.com/")

            ; ------------ BLUESKY ------------
            ; Replace Bluesky links with FxBluesky (https://github.com/FixTweet/FxTwitter)
            temp_clipboard := StrReplace(temp_clipboard, "https://bsky.app/", "https://fxbsky.app/")

            ; ------------ REDDIT ------------
            ; Replace Reddit links with fxreddit (https://github.com/MinnDevelopment/fxreddit)
            temp_clipboard := StrReplace(temp_clipboard, "https://reddit.com/", "https://rxddit.com/")
            temp_clipboard := StrReplace(temp_clipboard, "https://www.reddit.com/", "https://www.rxddit.com/")
            temp_clipboard := StrReplace(temp_clipboard, "https://old.reddit.com/", "https://old.rxddit.com/")

            ; ------------ TIKTOK ------------
            ; Replace TikTok links with fxTikTok (https://github.com/okdargy/fxTikTok)
            temp_clipboard := StrReplace(temp_clipboard, "https://www.tiktok.com/", "https://www.tnktok.com/")
            temp_clipboard := StrReplace(temp_clipboard, "https://vm.tiktok.com/", "https://vm.tnktok.com/")

            ; ------------ INSTAGRAM ------------
            ; Replace Instagram links with InstaFix (https://github.com/Wikidepia/InstaFix)
            temp_clipboard := StrReplace(temp_clipboard, "https://www.instagram.com/", "https://www.ddinstagram.com/")
            temp_clipboard := StrReplace(temp_clipboard, "https://instagram.com/", "https://ddinstagram.com/")


            A_Clipboard := temp_clipboard
        }
    }
    Sleep 100 ; 100ms seems safe to prevent loopback, could try with less and experiment
}