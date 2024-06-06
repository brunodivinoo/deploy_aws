const bcrypt = require('bcrypt');

const plainPassword = 'admin';

bcrypt.hash(plainPassword, 10, (err, hash) => {
    if (err) {
        console.error('Erro ao gerar o hash:', err);
    } else {
        console.log('Hash gerado:', hash);
    }
});
