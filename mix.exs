defmodule Serv.Mixfile do
  use Mix.Project

  def project do
    [
      app: :serv,
      version: "0.1.1",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(), #
      package: package(),
      deps: deps(),
      name: "Database_serv",
      source_url: "https://github.com/Feo740/GenServer"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:logger],
      registered: [:database_app],
      mod: {D_apl, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
  #  {:ex_doc, ">= 0.0.0", only: :dev},
          #{:ex_doc, github: "elixir-lang/ex_doc"},
  #  {:markdown, github: "devinus/markdown"}
      #{:serv, "0.1.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp description() do
    "Учебный проект создания базы данных с использованием максимального количества возможностей Erlang/Elixir"
  end

  defp package() do
    [
      #Эту опцию ставим только если не хотим пользоваться именем OTP приложения
      #name: "Database_serv",
      # Сюда файлы, которые по умолчанию будут в пакете
      files: ["lib", "mix.exs", "test", "doc", "deps", "config", "README.md"],
      maintainers: ["Feodor Terekhov"],
      licenses: ["OpenSource"],
      links: %{"GitHub" => "https://github.com/Feo740/GenServer"}
    ]
  end


end
