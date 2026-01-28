# App Handler
Åpne, lukke, eller finne eksisterende apper. Og åpne URL.

## Kjøring
1. Åpne terminalen.
### MacOS
Command + Space + skriv inn "Terminal" eller F4 + skriv inn "Terminal"
### Linux
Ctrl + Alt + t

2. Gå til riktig path med `cd` kommandoen:
```sh
cd path/til/app-handler
```

3. Gi hoved bash filen riktig tilgang:
```sh
chmod +x ./main.bash
```

4. Kjør programmet:
```sh
./main.bash
```

## Kommandoer brukt
### MacOS
- `open`
- `pkill`
- `pgrep`

### Linux
- `xdg-open`
- `pkill`
- `pgrep`

## Demo
![Showing run result](./images/run_program_result.png)

> [!NOTE]
> `xdg-open` for sudo (system nivå) fungerer ikke.