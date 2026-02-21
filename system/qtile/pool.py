import asyncio

from libqtile.widget import TextBox


class ContinuousPoll(TextBox):
    def __init__(self, cmd):
        TextBox.__init__(self)
        self.cmd = cmd
        self._finalized = False

    async def _config_async(self):
        proc = await asyncio.create_subprocess_shell(
            self.cmd,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.DEVNULL
        )

        while not self._finalized:
            out = await proc.stdout.readline()
                # process has exited so clear text and exit loop
            if not out:
                self.update("")
                break

            self.update(out.decode())

    def finalize(self):
        self._finalized = True
        TextBox.finalize(self)