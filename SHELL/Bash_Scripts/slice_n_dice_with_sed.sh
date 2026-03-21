
-- get slice of file from a pattern match "[mfa]" and to the first empty line
sed -En '/\[mfa-test\]/,/^$/{p}' ~/.aws/credentials

-- delete slice of file from a pattern match "[mfa]" and to the first empty line - and keep original file saved under ".bak"
sed -i.bak '/\[mfa-test\]/,/^$/d' ~/.aws/credentials
