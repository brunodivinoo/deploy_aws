const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const multer = require('multer');
const path = require('path');
const session = require('express-session');
const bcrypt = require('bcrypt');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('public'));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.use(session({
    secret: 'secret-key',
    resave: false,
    saveUninitialized: true
}));

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'sistema_cadastro'
});

connection.connect((err) => {
    if (err) throw err;
    console.log('MySQL conectado...');
});

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage });

// Middleware para verificar a autenticação para todas as rotas, exceto login
app.use((req, res, next) => {
    if (req.session.loggedIn || req.path === '/login' || req.path === '/login.html') {
        return next();
    } else {
        return res.redirect('/login');
    }
});

app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'login.html'));
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const sql = 'SELECT * FROM usuarios WHERE username = ?';
    connection.query(sql, [username], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            const user = results[0];
            bcrypt.compare(password, user.password, (err, match) => {
                if (err) throw err;
                if (match) {
                    req.session.loggedIn = true;
                    req.session.username = user.username;
                    req.session.role = user.role;
                    res.redirect('/listagem');
                } else {
                   res.send('Usuário ou senha inválidos');
                }
            });
        } else {
            res.send('Usuário ou senha inválidos');
        }
    });
});

app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            return res.send('Erro ao sair');
        }
        res.redirect('/login');
    });
});

app.get('/listagem', (req, res) => {
    res.sendFile(path.join(__dirname, 'listagem.html'));
});

app.get('/individuos', (req, res) => {
    const sql = 'SELECT * FROM individuos';
    connection.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.get('/index.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.post('/cadastro', upload.array('imagens', 10), (req, res) => {
    const {
        nome,
        alcunha,
        data_nascimento,
        cpf,
        rg,
        genitora,
        pai,
        telefone,
        cep,
        estado,
        cidade,
        logradouro,
        bairro,
        latitude,
        longitude,
        faccao,
        funcao,
        observacao,
        placa_veiculo
    } = req.body;

    const imagens = req.files.map(file => file.filename);
    const primeiraImagem = imagens.length > 0 ? imagens[0] : null;

    const sqlIndividuo = `INSERT INTO individuos (nome, alcunha, data_nascimento, cpf, rg, genitora, pai, telefone, cep, estado, cidade, logradouro, bairro, latitude, longitude, faccao, funcao, observacao, placa_veiculo, imagem) 
                          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

    const valuesIndividuo = [
        nome,
        alcunha || null,
        data_nascimento || null,
        cpf || null,
        rg || null,
        genitora || null,
        pai || null,
        telefone || null,
        cep || null,
        estado || null,
        cidade || null,
        logradouro || null,
        bairro || null,
        latitude || null,
        longitude || null,
        faccao || null,
        funcao || null,
        observacao || null,
        placa_veiculo || null,
        primeiraImagem
    ];

    connection.query(sqlIndividuo, valuesIndividuo, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Erro ao criar o cadastro.');
        }
        const individuoId = result.insertId;
        const sqlImagens = 'INSERT INTO imagens (individuo_id, imagem) VALUES ?';
        const valuesImagens = imagens.map(imagem => [individuoId, imagem]);

        connection.query(sqlImagens, [valuesImagens], (err, result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Erro ao salvar as imagens.');
            }
            res.redirect('/listagem');
        });
    });
});

app.get('/editar.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'editar.html'));
});

app.get('/editar/:id', (req, res) => {
    const sql = 'SELECT * FROM individuos WHERE id = ?';
    connection.query(sql, [req.params.id], (err, result) => {
        if (err) throw err;
        res.json(result[0]);
    });
});

app.post('/editar/:id', upload.array('novas_imagens', 10), (req, res) => {
    const {
        nome,
        alcunha,
        data_nascimento,
        cpf,
        rg,
        genitora,
        pai,
        telefone,
        cep,
        estado,
        cidade,
        logradouro,
        bairro,
        latitude,
        longitude,
        faccao,
        funcao,
        observacao,
        placa_veiculo
    } = req.body;

    const novasImagens = req.files.map(file => file.filename);

    const sqlUpdate = `UPDATE individuos SET nome = ?, alcunha = ?, data_nascimento = ?, cpf = ?, rg = ?, genitora = ?, pai = ?, telefone = ?, cep = ?, estado = ?, cidade = ?, logradouro = ?, bairro = ?, latitude = ?, longitude = ?, faccao = ?, funcao = ?, observacao = ?, placa_veiculo = ? WHERE id = ?`;

    const valuesUpdate = [
        nome,
        alcunha || null,
        data_nascimento || null,
        cpf || null,
        rg || null,
        genitora || null,
        pai || null,
        telefone || null,
        cep || null,
        estado || null,
        cidade || null,
        logradouro || null,
        bairro || null,
        latitude || null,
        longitude || null,
        faccao || null,
        funcao || null,
        observacao || null,
        placa_veiculo || null,
        req.params.id
    ];

    connection.query(sqlUpdate, valuesUpdate, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Erro ao atualizar o cadastro.');
        }

        if (novasImagens.length > 0) {
            const sqlImagens = 'INSERT INTO imagens (individuo_id, imagem) VALUES ?';
            const valuesImagens = novasImagens.map(imagem => [req.params.id, imagem]);

            connection.query(sqlImagens, [valuesImagens], (err, result) => {
                if (err) {
                    console.error(err);
                    return res.status(500).send('Erro ao salvar as novas imagens.');
                }

                const sqlPrimeiraImagem = `UPDATE individuos SET imagem = ? WHERE id = ?`;
                connection.query(sqlPrimeiraImagem, [novasImagens[0], req.params.id], (err, result) => {
                    if (err) {
                        console.error(err);
                        return res.status(500).send('Erro ao atualizar a primeira imagem.');
                    }
                    res.redirect('/listagem');
                });
            });
        } else {
            res.redirect('/listagem');
        }
    });
});

app.delete('/excluir_imagem/:imagemId', (req, res) => {
    const sql = 'DELETE FROM imagens WHERE id = ?';
    connection.query(sql, [req.params.imagemId], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Erro ao excluir a imagem.');
        }
        res.send('Imagem excluída com sucesso.');
    });
});

app.get('/excluir/:id', (req, res) => {
    const sqlDeleteImages = 'DELETE FROM imagens WHERE individuo_id = ?';
    connection.query(sqlDeleteImages, [req.params.id], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Erro ao deletar as imagens.');
        }

        const sqlDeleteIndividuo = 'DELETE FROM individuos WHERE id = ?';
        connection.query(sqlDeleteIndividuo, [req.params.id], (err, result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Erro ao deletar o indivíduo.');
            }
            res.send('Indivíduo deletado com sucesso.');
        });
    });
});

app.get('/imagens/:individuo_id', (req, res) => {
    const sql = 'SELECT id, imagem FROM imagens WHERE individuo_id = ?';
    connection.query(sql, [req.params.individuo_id], (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.get('/visualizar/:id', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'visualizar.html'));
});

app.get('/detalhes/:id', (req, res) => {
    const sqlIndividuo = 'SELECT * FROM individuos WHERE id = ?';
    const sqlImagens = 'SELECT imagem FROM imagens WHERE individuo_id = ?';

    connection.query(sqlIndividuo, [req.params.id], (err, individuoResult) => {
        if (err) throw err;

        connection.query(sqlImagens, [req.params.id], (err, imagensResult) => {
            if (err) throw err;

            res.json({ individuo: individuoResult[0], imagens: imagensResult });
        });
    });
});

app.get('/usuarios', (req, res) => {
    if (req.session.role !== 'admin') {
        return res.status(403).send('Acesso negado');
    }
    const sql = 'SELECT id, username, role FROM usuarios';
    connection.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.post('/usuarios', (req, res) => {
    if (req.session.role !== 'admin') {
        return res.status(403).send('Acesso negado');
    }
    const { username, password, role } = req.body;
    bcrypt.hash(password, 10, (err, hash) => {
        if (err) throw err;
        const sql = 'INSERT INTO usuarios (username, password, role) VALUES (?, ?, ?)';
        connection.query(sql, [username, hash, role], (err, result) => {
            if (err) throw err;
            res.send('Usuário criado com sucesso');
        });
    });
});

app.put('/usuarios/:id', (req, res) => {
    if (req.session.role !== 'admin') {
        return res.status(403).send('Acesso negado');
    }
    const { username, password, role } = req.body;
    bcrypt.hash(password, 10, (err, hash) => {
        if (err) throw err;
        const sql = 'UPDATE usuarios SET username = ?, password = ?, role = ? WHERE id = ?';
        connection.query(sql, [username, hash, role, req.params.id], (err, result) => {
            if (err) throw err;
            res.send('Usuário atualizado com sucesso');
        });
    });
});

app.delete('/usuarios/:id', (req, res) => {
    if (req.session.role !== 'admin') {
        return res.status(403).send('Acesso negado');
    }
    const sql = 'DELETE FROM usuarios WHERE id = ?';
    connection.query(sql, [req.params.id], (err, result) => {
        if (err) throw err;
        res.send('Usuário deletado com sucesso');
    });
});

app.get('/current_user', (req, res) => {
    if (req.session.loggedIn) {
        res.json({ username: req.session.username, role: req.session.role });
    } else {
        res.status(401).send('Usuário não autenticado');
    }
});

// Rota para servir o arquivo cadastro_usuario.html
app.get('/cadastro_usuario', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'cadastro_usuario.html'));
});

// Rota para servir o arquivo gerenciar_usuarios.html
app.get('/gerenciar_usuarios', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'gerenciar_usuarios.html'));
});

app.post('/cadastro_usuario', (req, res) => {
    if (req.session.role !== 'admin') {
        return res.status(403).send('Acesso negado');
    }
    const { username, password, role } = req.body;
    bcrypt.hash(password, 10, (err, hash) => {
        if (err) throw err;
        const sql = 'INSERT INTO usuarios (username, password, role) VALUES (?, ?, ?)';
        connection.query(sql, [username, hash, role], (err, result) => {
            if (err) throw err;
            res.send('Usuário criado com sucesso');
        });
    });
});

// Rota para upload de imagem via CKEditor
app.post('/upload_image', upload.single('upload'), (req, res) => {
    const file = req.file;
    const url = `/uploads/${file.filename}`;
    res.json({
        uploaded: true,
        url: url
    });
});

app.listen(3001, () => {
    console.log('Servidor rodando em http://localhost:3001');
});

app.get('/dbtest', (req, res) => {
    connection.query('SELECT 1', (err, results) => {
        if (err) {
            console.log('Erro ao conectar ao banco de dados:', err);
            res.status(500).send('Erro ao conectar ao banco de dados');
        } else {
            res.send('Conexão com banco de dados bem-sucedida');
        }
    });
});

app.get('/listagem', (req, res) => {
    console.log('Rota /listagem acessada');
    res.sendFile(path.join(__dirname, 'listagem.html'), (err) => {
        if (err) {
            console.log('Erro ao enviar arquivo listagem.html:', err);
            res.status(500).send('Erro ao carregar página');
        }
    });
});

console.log('Variáveis de ambiente:', process.env);
