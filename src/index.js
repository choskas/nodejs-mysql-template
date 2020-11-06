const express = require('express');
const morgan = require('morgan');
//inicializacion
const app = express();

//configuraciones
app.set('port', process.env.PORT || 4000);

//middleware
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json())

// variables globales
app.use((eq, res, next) => {
    next();
})

//rutas
app.use('/', require('./routes/index.js'))
app.use('/api',require('./routes/auth'))
//public

//start server
app.listen(app.get('port'), () => {
    console.log('server on port ', app.get('port') );
})