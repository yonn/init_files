base64 -d<<-EOF |
H4sIACFPWVcCA+1UN5LkMAzM+YqO1j/ivDfZmZAzhLyALRIclX5/INeb6LxL0UCrDUsfaT8SWJA0em4pJqhgkh25z5IxsizQjhDzRAmeA5IgCF66h2jyNGEr89zrTKz7CUvnFS/3Zzvpeey5hTSVZ5E8Bd5XtKQFTGiizMa3Qow+os2rcy8x5KRYPLOHkrGvdtvJUjkbosko3XNR9Zj9SBXOHEy1mjTn3tGucEm5b/vd+cLpjflEWsdBFr4BxMzwUYyv+gyUKNbVG1uX393G9QaQ/IpWJGxWujGvPjymniptl89JnUW/o5owg/y2O0+ikYhUKuC2RBfRkY8l3A0Rw/YsgxNssha0lKciSN0KlaqhV/eSUx/oBAthY6T1G7WbC5ZWajdsGq4qbv18JnEhoz1XfzqdUbqHBvRNde7TiJnu9PJESsHVrqHrlbiNwaHKI/qjOvrDxB68l+7kuszD+0a3LZ2Ab03cwfNvOvjDXvZ3+Ov8f9H/xX4Bv00Z6EoHAAA=
EOF
gunzip | while IFS= read -n1 c; do
    printf %c "${c:-$'\n'}"
        sleep 0.05
	    [ "$c" ] || sleep 0.3
done
