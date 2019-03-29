## mfc-pn532

This is a Docker image for recovering keys of MIFARE Classic cards using the
PN532 RFID module connected to the computer via a USB to UART adapter. It
includes libnfc (1.5.1), mfcuk (r65, commit 1b6d022) and mfoc (0.10.2, commit
2be5d8d).

The reason for using old versions of these tools is that recent mfcuk
revisions are known not to work with the PN532.

Note that the tools might not work when running in a virtualized environment.
You should use this image directly in a physical computer, and not within a
virtual machine.

Use the `--device` flag when running in order to expose the PN532 device to
the container. If its path is different from `/dev/ttyUSB`, you will have to
modify the `libnfc.conf` file.

### References

- [Using mfcuk r65 with libnfc 1.5.1 in 2018](https://gist.github.com/ceres-c/b84935799f5d65a4e41328d3ceaa075c)
- [nfc-tools/libnfc](https://github.com/nfc-tools/mfoc)
- [nfc-tools/mfcuk](https://github.com/nfc-tools/mfcuk)
- [nfc-tools/mfoc](https://github.com/nfc-tools/mfoc)
