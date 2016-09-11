\version "2.18.2"

\header {
  title = "Walk The Moon — Shut Up And Dance With Me"
}

up = \drummode {
  \repeat percent 2 { bd4 bd bd bd }

  \set countPercentRepeats = ##t
  \repeat percent 5 {
    <hh bd>8[ hh] <hh bd>[ hh] <hh bd>[ hh] <hh bd>[ hh]
    <hh bd>8[ hh] <hh bd>[ hh] <hh bd>[ hh] <hh bd>[ hho]
  }
}

\score {
  \new DrumStaff {
    \new DrumVoice {
      \voiceOne \up
    }
  }

  \layout {}
}
