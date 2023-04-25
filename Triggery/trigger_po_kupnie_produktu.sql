CREATE TRIGGER po_kupnie_produktu
AFTER UPDATE ON produkty
FOR EACH ROW
UPDATE historia_zakupow
SET data_zakupu = NOW()
WHERE data_zakupu = '0000-00-00';