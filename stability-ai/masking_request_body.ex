defmodule MaskingRequestBody do
  @moduledoc """
  Provides struct and type for a MaskingRequestBody
  """

  @type t :: %__MODULE__{
          cfg_scale: number | nil,
          clip_guidance_preset: String.t() | nil,
          extras: map | nil,
          init_image: String.t(),
          mask_image: String.t() | nil,
          mask_source: String.t(),
          sampler: String.t() | nil,
          samples: integer | nil,
          seed: integer | nil,
          steps: integer | nil,
          style_preset: String.t() | nil,
          text_prompts: [TextPrompt.t()]
        }

  defstruct [
    :cfg_scale,
    :clip_guidance_preset,
    :extras,
    :init_image,
    :mask_image,
    :mask_source,
    :sampler,
    :samples,
    :seed,
    :steps,
    :style_preset,
    :text_prompts
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cfg_scale: :number,
      clip_guidance_preset:
        {:enum, ["FAST_BLUE", "FAST_GREEN", "NONE", "SIMPLE", "SLOW", "SLOWER", "SLOWEST"]},
      extras: :map,
      init_image: {:string, :generic},
      mask_image: {:string, :generic},
      mask_source: {:string, :generic},
      sampler:
        {:enum,
         [
           "DDIM",
           "DDPM",
           "K_DPMPP_2M",
           "K_DPMPP_2S_ANCESTRAL",
           "K_DPM_2",
           "K_DPM_2_ANCESTRAL",
           "K_EULER",
           "K_EULER_ANCESTRAL",
           "K_HEUN",
           "K_LMS"
         ]},
      samples: :integer,
      seed: :integer,
      steps: :integer,
      style_preset:
        {:enum,
         [
           "enhance",
           "anime",
           "photographic",
           "digital-art",
           "comic-book",
           "fantasy-art",
           "line-art",
           "analog-film",
           "neon-punk",
           "isometric",
           "low-poly",
           "origami",
           "modeling-compound",
           "cinematic",
           "3d-model",
           "pixel-art",
           "tile-texture"
         ]},
      text_prompts: [{TextPrompt, :t}]
    ]
  end
end
