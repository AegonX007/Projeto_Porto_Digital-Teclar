class Curso {
  String _email;
  int _pontuacao;
  bool _audio;
  bool _video;
  bool _texto;

  Curso(this._email, this._pontuacao, this._audio, this._video, this._texto);

  String get categoria => _email;

  set categoria(String value) {
    _email = value;
  }

  int get pontuacao => _pontuacao;

  set pontuacao(int value) {
    _pontuacao = value;
  }

  bool get audio => _audio;
  set audio(bool value) {
    _audio = value;
  }

  bool get video => _video;
  set video(bool value) {
    _video = value;
  }

  bool get texto => _texto;
  set texto(bool value) {
    _texto = value;
  }
}
